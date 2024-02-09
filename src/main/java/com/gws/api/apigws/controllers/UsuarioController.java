package com.gws.api.apigws.controllers;

import com.gws.api.apigws.DTOs.ImagemDtos;
import com.gws.api.apigws.DTOs.UsuariosDTOs;
import com.gws.api.apigws.models.DemandasModel;
import com.gws.api.apigws.models.HardSkillsModel;
import com.gws.api.apigws.models.SoftSkillsModel;
import com.gws.api.apigws.models.UsuarioModel;
import com.gws.api.apigws.repositories.DemandasRepository;
import com.gws.api.apigws.repositories.HardSkillsRepository;
import com.gws.api.apigws.repositories.SoftSkillsRepository;
import com.gws.api.apigws.repositories.UsuariosRepository;
import com.gws.api.apigws.services.ConverterDataTime;
import com.gws.api.apigws.services.FileUploadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.IOException;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin(origins = "http://localhost:3000")

@RestController
@RequestMapping(value = "/usuarios", produces = {"application/json"})
public class UsuarioController {
    @Autowired
    UsuariosRepository usuarioRepository;
    @Autowired
    FileUploadService fileUploadService;
    @Autowired
    ConverterDataTime converterDataTime;


    @Autowired
    DemandasRepository demandasRepository;
    @Autowired
    SoftSkillsRepository softSkillsRepository;
    @Autowired
    HardSkillsRepository hardSkillsRepository;



    @GetMapping
    public ResponseEntity<List<UsuarioModel>> listarUsuarios(){

        for (UsuarioModel usuario : usuarioRepository.findAll()) {
            String fileFoto = fileUploadService.getDiretorioImg().toString();
            String strFoto = usuario.getUrl_img();

            String linkFoto = fileFoto+strFoto;
            usuario.setUrl_img(linkFoto);
        }

        return ResponseEntity.status(HttpStatus.OK).body(usuarioRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> buscarUsuario(@PathVariable(value = "id") UUID id){
        Optional<UsuarioModel> usuarioBuscado = usuarioRepository.findById(id);

        if (usuarioBuscado.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuario não encontrado");
        }

        // fazer um novo end point para android e um get sem isso
        Path urlImg = fileUploadService.getDiretorioImg();
        UsuarioModel usuarioimg = usuarioBuscado.get();
        UsuarioModel usuario = usuarioBuscado.get();
        usuario.setUrl_img(urlImg+ "\\" +usuarioimg.getUrl_img());

        return ResponseEntity.status(HttpStatus.OK).body(usuarioBuscado.get());
    }

    @Operation(summary = "Método para cadastrar um Usuário", method = "POST")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Cadastro foi efetuado com sucesso"),
            @ApiResponse(responseCode = "400", description = "Paramatros inválidos")
    })
    @PostMapping(consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Object> criarUsuario(@ModelAttribute @Valid UsuariosDTOs usuariosDtos) {
        if (usuarioRepository.findByEmail(usuariosDtos.email()) != null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Usuario já cadastrado");
        }

        UsuarioModel novoUsuario = new UsuarioModel();
        BeanUtils.copyProperties(usuariosDtos, novoUsuario);

        String urlImagem;
        LocalDateTime dataAtual = LocalDateTime.now();


        try {
            urlImagem = fileUploadService.fazerUpload(usuariosDtos.foto());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        LocalTime horassemanais;
        LocalDate dataferias;

        try{
            horassemanais = converterDataTime.StringToDateTime(usuariosDtos.horasDoDia());
            dataferias = converterDataTime.StringToDate(usuariosDtos.dataDaferias());
        }catch (Exception e){
            throw new RuntimeException(e);

        }

        novoUsuario.setUrl_img(urlImagem);
        novoUsuario.setData_cadastro(dataAtual);
        novoUsuario.setHoras(horassemanais);
        novoUsuario.setData_ferias(dataferias);


        List<UUID> demandasConvert = usuariosDtos.id_demandas().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<DemandasModel> demandasList = demandasRepository.findAllById(demandasConvert);
        if (novoUsuario.getId_demandas().containsAll(demandasList)){

            Set<DemandasModel> demandasAssociadas = new HashSet<>(demandasList);
            novoUsuario.setId_demandas(demandasAssociadas);

        }

        List<UUID> softConvert = usuariosDtos.id_demandas().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<SoftSkillsModel> softSkillsList = softSkillsRepository.findAllById(softConvert);
        if (novoUsuario.getId_softskill().containsAll(softSkillsList)){

            Set<SoftSkillsModel> softSkillsAssociadas = new HashSet<>(softSkillsList);
            novoUsuario.setId_softskill(softSkillsAssociadas);

        }

        List<UUID> hardConvert = usuariosDtos.id_demandas().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<HardSkillsModel> hardSkillsList = hardSkillsRepository.findAllById(hardConvert);
        if (novoUsuario.getId_hardskill().containsAll(hardSkillsList)) {

            Set<HardSkillsModel> hardSkillsAssociadas = new HashSet<>(hardSkillsList);
            novoUsuario.setId_hardskill(hardSkillsAssociadas);

        }

        String senhaCript = new BCryptPasswordEncoder().encode(usuariosDtos.senha());
        novoUsuario.setSenha(senhaCript);

        return ResponseEntity.status(HttpStatus.CREATED).body(usuarioRepository.save(novoUsuario));
    }

    @PutMapping(value = "/{id}" , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Object> editarUsuario(@PathVariable(value = "id") UUID id, @ModelAttribute @Valid UsuariosDTOs usuariosDtos){
        Optional<UsuarioModel> buscandoUsuario = usuarioRepository.findById(id);

        if (buscandoUsuario.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
        }

        Set<DemandasModel> demandasAssociadas = new HashSet<>();
        Set<SoftSkillsModel> softSkillsAssociadas = new HashSet<>();
        Set<HardSkillsModel> hardSkillsAssociadas = new HashSet<>();

        if (!usuariosDtos.id_demandas().isEmpty()){
            List<DemandasModel> demandasList = demandasRepository.findAllById(Collections.singleton(UUID.fromString(String.valueOf(usuariosDtos.id_demandas()))));
        demandasAssociadas.addAll(demandasList);}

        if (!usuariosDtos.id_softSkills().isEmpty()){
            List<SoftSkillsModel> softSkillsList = softSkillsRepository.findAllById(Collections.singleton(UUID.fromString(String.valueOf(usuariosDtos.id_softSkills()))));
        softSkillsAssociadas.addAll(softSkillsList);}

        if (!usuariosDtos.id_hardskills().isEmpty()){
            List<HardSkillsModel> hardSkillsList = hardSkillsRepository.findAllById(Collections.singleton(UUID.fromString(String.valueOf(usuariosDtos.id_hardskills()))));
        hardSkillsAssociadas.addAll(hardSkillsList);}



        UsuarioModel usuarioEditado = buscandoUsuario.get();
        BeanUtils.copyProperties(usuariosDtos, usuarioEditado);

        String urlImagem;

        try{
            urlImagem = fileUploadService.fazerUpload(usuariosDtos.foto());
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        LocalTime horassemanais;
        LocalDate dataferias;

        try{
            horassemanais = converterDataTime.StringToDateTime(usuariosDtos.horasDoDia());
            dataferias = converterDataTime.StringToDate(usuariosDtos.dataDaferias());
        }catch (Exception e){
            throw new RuntimeException(e);
        }

        usuarioEditado.setUrl_img(urlImagem);
        usuarioEditado.setHoras(horassemanais);
        usuarioEditado.setData_ferias(dataferias);



        if (usuarioEditado.getId_demandas().containsAll(demandasAssociadas)){
            usuarioEditado.setId_demandas(demandasAssociadas);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Demanadas Não encontradas");
        }

        if (usuarioEditado.getId_softskill().containsAll(softSkillsAssociadas)){
            usuarioEditado.setId_softskill(softSkillsAssociadas);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("SoftSkills Não encontradas");
        }

        if (usuarioEditado.getId_hardskill().containsAll(hardSkillsAssociadas)){
            usuarioEditado.setId_hardskill(hardSkillsAssociadas);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("HardSkills Não encontradas");
        }

        String senhaCript = new BCryptPasswordEncoder().encode(usuariosDtos.senha());
        usuarioEditado.setSenha(senhaCript);

        return ResponseEntity.status(HttpStatus.CREATED).body(usuarioRepository.save(usuarioEditado));
    }

    @PutMapping(value = "/editarImagem/{idUsuario}", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Object> editarImagemUsuario(@PathVariable(value = "idUsuario") UUID id, @ModelAttribute @Valid ImagemDtos imagemDto){
        Optional<UsuarioModel> usuarioBuscado = usuarioRepository.findById(id);

        if (usuarioBuscado.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuario não encontrado");
        }
        UsuarioModel usuarioBd = usuarioBuscado.get();
        BeanUtils.copyProperties(usuarioBuscado, usuarioBd);
        String urlImagem;

        try{
            urlImagem = fileUploadService.fazerUpload(imagemDto.imagem());
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        usuarioBd.setUrl_img(urlImagem);

        return ResponseEntity.status(HttpStatus.OK).body(usuarioRepository.save(usuarioBd));

    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deletarUsuario(@PathVariable(value = "id") UUID id){

        Optional<UsuarioModel> usuarioBuscado = usuarioRepository.findById(id);

        if (usuarioBuscado.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuario não encontrado");
        }


        String link1 = usuarioBuscado.get().getUrl_img();
        String link2 = String.valueOf(fileUploadService.getDiretorioImg());

        try {
            fileUploadService.excluirArquivo(link2+link1);
        }catch (IOException e){
            throw new RuntimeException(e);
        }


        usuarioRepository.delete(usuarioBuscado.get());
        return ResponseEntity.status(HttpStatus.OK).body("Usuario deletado com sucesso!");

    }
}
