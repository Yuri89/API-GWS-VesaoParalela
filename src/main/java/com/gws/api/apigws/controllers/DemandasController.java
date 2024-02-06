package com.gws.api.apigws.controllers;

import com.gws.api.apigws.DTOs.DemandasDTOs;
import com.gws.api.apigws.models.*;
import com.gws.api.apigws.repositories.*;
import com.gws.api.apigws.services.ConcatenarStrings;
import com.gws.api.apigws.services.ConverterDataTime;
import com.gws.api.apigws.services.FileUploadService;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping(value = "/demandas", produces = {"application/json"})
public class DemandasController {
    @Autowired
    DemandasRepository demandasRepository;
    @Autowired
    FileUploadService fileUploadService;
    @Autowired
    ConverterDataTime converterDataTime;
    @Autowired
    UsuariosRepository usuariosRepository;
    @Autowired
    SegmentosRepository segmentosRepository;
    @Autowired
    ClientesRepository clientesRepository;
    @Autowired
    ConcatenarStrings concatenarStrings;
    @Autowired
    HardSkillsRepository hardSkillsRepository;
    @Autowired
    SoftSkillsRepository softSkillsRepository;


    @GetMapping
    public ResponseEntity<Map<String, Object>> ListarDemandas(){
        List<DemandasModel> demandasList = new ArrayList<>();
        List<String> linksAnexos = new ArrayList<>();

        for (DemandasModel demandas : demandasRepository.findAll()) {
            String filesDemanda = fileUploadService.getDiretorioAnx().toString();
            List<String> strDemanda = Arrays.asList(demandas.getAnexo().split(","));

            for (String listaLinks : strDemanda) {
                String lA = filesDemanda + listaLinks;
                linksAnexos.add(lA);
            }

            demandasList.add(demandas);
        }

        // Você pode decidir o que retornar com base na lógica do seu aplicativo
        // Neste exemplo, estamos retornando um Map que mapeia chaves para listas específicas.
        Map<String, Object> resposta = new HashMap<>();
        resposta.put("demandas", demandasList);
        resposta.put("linksAnexos", linksAnexos);

        return ResponseEntity.status(HttpStatus.OK).body(resposta);
    }


    @GetMapping(value = "/{id}")
    public ResponseEntity<Object> BuscarDemandas(@PathVariable(value = "id") UUID id){
        Optional<DemandasModel> buscandoDemandas = demandasRepository.findById(id);

        if (buscandoDemandas.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Demanda não encontrado");
        }

        List<String> linksAnexos = new ArrayList<>();
        String filesDemanda = fileUploadService.getDiretorioAnx().toString();
        List<String> strDemanda = Arrays.asList(buscandoDemandas.get().getAnexo().split(","));

        for (String listaLinks : strDemanda) {
            String lA = filesDemanda + listaLinks;
            linksAnexos.add(lA);
        }

        Map<String, Object> resposta = new HashMap<>();
        resposta.put("demandas", buscandoDemandas);
        resposta.put("linksAnexos", linksAnexos);

        return ResponseEntity.status(HttpStatus.OK).body(resposta);
    }

    @GetMapping(value = "/dashboard")
    public ResponseEntity<Object> BuscarDashboardDemandas(){

        List<DemandasModel> demandasList = demandasRepository.findAll();

        int total = 0;

        for (DemandasModel demandas : demandasList){
            int custo = demandas.getCusto();
            total =+ custo;
        }

        return ResponseEntity.status(HttpStatus.OK).body(total);
    }

    @PostMapping(consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Object> criarDemanda(@ModelAttribute @Valid DemandasDTOs demandasDTOs){

        if (demandasRepository.findByTitulo(demandasDTOs.titulo()) != null){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Demanda já cadastrado");
        }
        if (demandasDTOs.custo() >= 1_0000_000_000.00D){
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("Valor muito alto");
        }


        List<UUID> usuariosConvert = demandasDTOs.id_usuario().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<UsuarioModel> usuariosList = usuariosRepository.findAllById(usuariosConvert);
        Set<UsuarioModel> usuariosAssociados = new HashSet<>(usuariosList);

        List<UUID> segmentosConvert = demandasDTOs.id_segmento().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<SegmentosModel> segmentosList = segmentosRepository.findAllById(segmentosConvert);
        Set<SegmentosModel> segmentosAssociados = new HashSet<>(segmentosList);

        List<UUID> hardskill = demandasDTOs.id_hard().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<HardSkillsModel> hardList = hardSkillsRepository.findAllById(hardskill);
        Set<HardSkillsModel> hardAssociados = new HashSet<>(hardList);

        List<UUID> softskill = demandasDTOs.id_soft().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<SoftSkillsModel> softList = softSkillsRepository.findAllById(softskill);
        Set<SoftSkillsModel> softAssociados = new HashSet<>(softList);

        Optional<ClientesModel> clienteOptional = clientesRepository.findById(demandasDTOs.id_cliente());

        Optional<UsuarioModel> lidersquadOptional = usuariosRepository.findById(demandasDTOs.id_lider());




        DemandasModel novaDemanda = new DemandasModel();
        BeanUtils.copyProperties(demandasDTOs, novaDemanda);

        String urlArquivo;
        List<String> urlArquivoList = new ArrayList<>();
        int indice = 1;

        try{
            for (MultipartFile anexo : demandasDTOs.copy_anexo()){
                String urlArquivoLoop = fileUploadService.fazerMultiploUpload(anexo , demandasDTOs.titulo() ,indice);
                urlArquivoList.add(urlArquivoLoop);
                indice++;
            }
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        try{
            urlArquivo = concatenarStrings.juntarStrings(urlArquivoList);
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        LocalDate data1;
        LocalDateTime data2 = LocalDateTime.now();

        try{
            data1 = converterDataTime.StringToDate(demandasDTOs.data_final());

        }catch (Exception e){
            throw new RuntimeException(e);
        }


        novaDemanda.setAnexo(urlArquivo);
        novaDemanda.setData_final(data1);
        novaDemanda.setData_inicio(data2);



        if (clienteOptional.isPresent()){
            ClientesModel cliente = clienteOptional.get();
            novaDemanda.setId_cliente(cliente);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Cliente não encontrado");
        }

        if (lidersquadOptional.isPresent()){
            UsuarioModel lider = lidersquadOptional.get();
            novaDemanda.setLider_squad(lider);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Cliente não encontrado");
        }

        if (usuariosAssociados.containsAll(usuariosList)){
            novaDemanda.setId_usuarios(usuariosAssociados);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Usuarios não encontrado");
        }

        if (segmentosAssociados.containsAll(segmentosList)){
            novaDemanda.setId_segmentos(segmentosAssociados);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Segmentos não encontrado");
        }

        if (hardAssociados.containsAll(hardList)){
            novaDemanda.setId_hardskill(hardAssociados);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Hard Skill não encontrado");
        }

        if (softAssociados.containsAll(softList)){
            novaDemanda.setId_softskill(softAssociados);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Soft Skill não encontrado");
        }



        return ResponseEntity.status(HttpStatus.CREATED).body(demandasRepository.save(novaDemanda));
    }

    @PutMapping(value = "/{id}",consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Object> criarDemanda(@PathVariable(value = "id") UUID id, @ModelAttribute @Valid DemandasDTOs demandasDTOs){
        Optional<DemandasModel> buscandoDemanda = demandasRepository.findById(id);

        if (buscandoDemanda.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Demanda não encontrado");
        }

        if (demandasDTOs.custo() >= 1_0000_000_000.00D){
            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("Valor muito alto");
        }



        List<UUID> usuariosConvert = demandasDTOs.id_usuario().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<UsuarioModel> usuariosList = usuariosRepository.findAllById(usuariosConvert);
        Set<UsuarioModel> usuariosAssociados = new HashSet<>(usuariosList);

        List<UUID> segmentosConvert = demandasDTOs.id_segmento().stream()
                .map(UUID::fromString)
                .collect(Collectors.toList());

        List<SegmentosModel> segmentosList = segmentosRepository.findAllById(segmentosConvert);
        Set<SegmentosModel> segmentosAssociados = new HashSet<>(segmentosList);

        Optional<ClientesModel> clienteOptional = clientesRepository.findById(demandasDTOs.id_cliente());




        DemandasModel demandaEditado = buscandoDemanda.get();
        BeanUtils.copyProperties(demandasDTOs, demandaEditado);

        String urlArquivo;
        List<String> urlArquivoList = new ArrayList<>();
        int indice = 1;

        try{
            for (MultipartFile anexo : demandasDTOs.copy_anexo()){
                String urlArquivoLoop = fileUploadService.fazerMultiploUpload(anexo , demandasDTOs.titulo() ,indice);
                urlArquivoList.add(urlArquivoLoop);
                indice++;
            }
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        try{
            urlArquivo = concatenarStrings.juntarStrings(urlArquivoList);
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        LocalDate data1;
        LocalDateTime data2 = LocalDateTime.now();

        try{
            data1 = converterDataTime.StringToDate(demandasDTOs.data_final());
        }catch (Exception e){
            throw new RuntimeException(e);
        }

        demandaEditado.setAnexo(urlArquivo);
        demandaEditado.setData_final(data1);
        demandaEditado.setData_inicio(data2);


        if (clienteOptional.isPresent()){
            ClientesModel cliente = clienteOptional.get();
            demandaEditado.setId_cliente(cliente);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Cliente não encontrado");
        }

        if (usuariosAssociados.containsAll(usuariosList)){
            demandaEditado.setId_usuarios(usuariosAssociados);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Usuarios não encontrado");
        }


        if (segmentosAssociados.containsAll(segmentosList)){
            demandaEditado.setId_segmentos(segmentosAssociados);
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Segmentos não encontrado");
        }


        return ResponseEntity.status(HttpStatus.CREATED).body(demandasRepository.save(demandaEditado));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deletarDemanda(@PathVariable(value = "id") UUID id){

        Optional<DemandasModel> demandaBuscado = demandasRepository.findById(id);

        if (demandaBuscado.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
        }


        for (DemandasModel demandas : demandasRepository.findAll()) {
            String filesDemanda = fileUploadService.getDiretorioAnx().toString();
            List<String> strDemanda = Arrays.asList(demandas.getAnexo().split(","));

            for (String listaLinks : strDemanda) {
                try {
                    fileUploadService.excluirArquivo(filesDemanda + listaLinks);
                }catch (IOException e){
                    throw new RuntimeException(e);
                }

            }


        }


        demandasRepository.delete(demandaBuscado.get());
        return ResponseEntity.status(HttpStatus.OK).body("Cliente deletado com sucesso!");

    }
}
