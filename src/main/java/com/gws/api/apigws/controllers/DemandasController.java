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
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping(value = "/demandas", produces = {"application/json"})
public class DemandasController {
    @Autowired
    DemandasRepository demandasRepository;
    @Autowired
    ListaDemandasRepository listaDemandasRepository;

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
    @Autowired
    HorasTrabalhoRepository horasTrabalhoRepository;


    @GetMapping
    public ResponseEntity<Map<String, Object>> ListarDemandas(){
        List<DemandasModel> demandasList = new ArrayList<>();
        List<String> linksAnexos = new ArrayList<>();

        for (DemandasModel demandas : demandasRepository.findAll()) {
            String filesDemanda = fileUploadService.getDiretorioAnx().toString();

            String anexo = demandas.getAnexo();

            if (anexo != null) {
                if (anexo.contains(",")) {
                    List<String> strDemanda = Arrays.asList(anexo.split(","));
                    for (String listaLinks : strDemanda) {
                        String lA = filesDemanda+ "\\" + listaLinks.trim();
                        linksAnexos.add(lA);
                    }
                } else {
                    String lA = filesDemanda + "\\" + anexo.trim();
                    linksAnexos.add(lA);
                }
            }

            demandasList.add(demandas);
        }

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

        DemandasModel demanda = buscandoDemandas.get();
        List<String> linksAnexos = new ArrayList<>();
        String filesDemanda = fileUploadService.getDiretorioAnx().toString();

        String anexo = demanda.getAnexo();
        if (anexo != null) {
            List<String> strDemanda = Arrays.asList(anexo.split(","));
            for (String listaLinks : strDemanda) {
                String lA = filesDemanda + listaLinks;
                linksAnexos.add(lA);
            }
        }

        Map<String, Object> resposta = new HashMap<>();
        resposta.put("demandas", demanda);
        resposta.put("linksAnexos", linksAnexos);

        return ResponseEntity.status(HttpStatus.OK).body(resposta);
    }


    @GetMapping(value = "/lista-demandas")
    public ResponseEntity<Object> buscarListaDemandas() {

        List<ListaDemandasModel> demandasList = listaDemandasRepository.findAll();
        List<Map<String, Object>> respostaList = new ArrayList<>();

        for (ListaDemandasModel demanda : demandasList) {
            Map<String, Object> resposta = new LinkedHashMap<>();
            Set<ListaUsuariosModel> usuarios = demanda.getId_usuario();
            String[] anexos = demanda.getAnexo().split(",");

            for (int i = 0; i < anexos.length; i++) {
                anexos[i] = fileUploadService.getDiretorioAnx() + "\\" + anexos[i].trim();
            }

            List<String> anexosLista = List.of(anexos);

            for (ListaUsuariosModel usuario : usuarios) {
                String fileFoto = fileUploadService.getDiretorioImg().toString();

                String strFoto = usuario.getUrl_img();
                String linkFoto = fileFoto + "\\" + strFoto.trim();
                usuario.setUrl_img(linkFoto);
            }

            Set<TarefasInfoModel> tarefas = demanda.getTarefas();
            int tamanhoTarefa = tarefas.size();
            int tamanhoUm = 0;
            int tamanhoDois = 0;

            for (TarefasInfoModel tamanho : tarefas) {
                tamanhoUm++;
                if (tamanho.getConclusao() == TipoConclusao.TUDO_CONCLUIDO) {
                    tamanhoDois++;
                }
            }

            double porcentagem = 0;

            if (tamanhoUm < 0){
                porcentagem =  ((double)tamanhoDois / (double)tamanhoUm)*100;
            }


            resposta.put("demandas", demanda);
            resposta.put("tamanho", tamanhoTarefa);
            resposta.put("concluidas", tamanhoDois);
            resposta.put("porcentagem", porcentagem);
            resposta.put("anexos", anexosLista);

            respostaList.add(resposta);
        }

        return ResponseEntity.status(HttpStatus.OK).body(respostaList);
    }

    @GetMapping(value = "/dashboard")
    public ResponseEntity<Object> BuscarDashboardDemandas(){

        List<DemandasModel> demandasList = demandasRepository.findAll();
        List<HorasTrabalhoModel> horasList = horasTrabalhoRepository.findAll();
        Map<String , Object> listaInfo = new HashMap<>();

        double total = 0;
        int numeroDemandas = 0;
        int demandasAtivas = 0;
        int horatotais = 0;

        for (DemandasModel demandas : demandasList){
            double custo = demandas.getCusto();
            total += custo;
            numeroDemandas++;
            if (demandas.getStatus() == TipoStatusModel.EM_PROGRESSO || demandas.getStatus() == TipoStatusModel.NOVO){
                demandasAtivas++;
            }
        }

        for (HorasTrabalhoModel horas : horasList){
            int horasDb = horas.getHoras();
            horatotais += horasDb;
        }

        listaInfo.put("Custo",total);
        listaInfo.put("NumeroDemandas", numeroDemandas);
        listaInfo.put("DemandasAtivas", demandasAtivas);
        listaInfo.put("HorasTotais", horatotais);

        return ResponseEntity.status(HttpStatus.OK).body(listaInfo);
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

        DemandasModel novaDemanda = new DemandasModel();
        BeanUtils.copyProperties(demandasDTOs, novaDemanda);

        String urlArquivo;
        String urlArquivoLogo;
        List<String> urlArquivoList = new ArrayList<>();
        int indice = 1;


        try {
            for (MultipartFile anexo : demandasDTOs.copy_anexo()) {
                String urlArquivoLoop = fileUploadService.fazerMultiploUpload(anexo, demandasDTOs.titulo(), indice);
                urlArquivoList.add(urlArquivoLoop);
                indice++;
            }

            urlArquivoLogo = fileUploadService.fazerUpload(demandasDTOs.logo());

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        try {
            urlArquivo = concatenarStrings.juntarStrings(urlArquivoList);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        LocalDate data1;
        LocalDate data2;

        try{
            data1 = converterDataTime.StringToDate(demandasDTOs.data_final());
            data2 = converterDataTime.StringToDate(demandasDTOs.data_inicio());
        }catch (Exception e){
            throw new RuntimeException(e);
        }

        novaDemanda.setLogo(urlArquivoLogo);
        novaDemanda.setAnexo(urlArquivo);
        novaDemanda.setData_final(data1);
        novaDemanda.setData_inicio(data2);

        if (demandasDTOs.id_cliente() != null){
            Optional<ClientesModel> clienteOptional = clientesRepository.findById(demandasDTOs.id_cliente());

            if (clienteOptional.isPresent()){
                ClientesModel cliente = clienteOptional.get();
                novaDemanda.setId_cliente(cliente);
            }else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Cliente não encontrado");
            }
        }
        if (demandasDTOs.id_lider() != null){
            Optional<UsuarioModel> lidersquadOptional = usuariosRepository.findById(demandasDTOs.id_lider());
            if (lidersquadOptional.isPresent()){
                UsuarioModel lider = lidersquadOptional.get();
                novaDemanda.setLider_squad(lider);
            }else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Cliente não encontrado");
            }
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
        String urlArquivoLogo;
        List<String> urlArquivoList = new ArrayList<>();
        int indice = 1;

        try{
            for (MultipartFile anexo : demandasDTOs.copy_anexo()){
                String urlArquivoLoop = fileUploadService.fazerMultiploUpload(anexo , demandasDTOs.titulo() ,indice);
                urlArquivoList.add(urlArquivoLoop);
                indice++;
            }

            urlArquivoLogo = fileUploadService.fazerUpload(demandasDTOs.logo());

        }catch (IOException e){
            throw new RuntimeException(e);
        }

        try{
            urlArquivo = concatenarStrings.juntarStrings(urlArquivoList);
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        LocalDate data1;
        LocalDate data2;

        try{
            data1 = converterDataTime.StringToDate(demandasDTOs.data_final());
            data2 = converterDataTime.StringToDate(demandasDTOs.data_inicio());
        }catch (Exception e){
            throw new RuntimeException(e);
        }

        demandaEditado.setLogo(urlArquivoLogo);
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
