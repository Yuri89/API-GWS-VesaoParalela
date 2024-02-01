package com.gws.api.apigws.controllers;


import com.gws.api.apigws.DTOs.AvaliacaoDTO;
import com.gws.api.apigws.DTOs.ClientesDTOs;
import com.gws.api.apigws.models.*;
import com.gws.api.apigws.repositories.AvaliacaoRepository;
import com.gws.api.apigws.repositories.ClientesRepository;
import com.gws.api.apigws.repositories.TarefasRepository;
import com.gws.api.apigws.repositories.UsuariosRepository;
import com.gws.api.apigws.services.FileUploadService;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping(value = "/avaliacao", produces = {"application/json"})
public class AvaliacaoController {

    @Autowired
    AvaliacaoRepository avaliacaoRepository;
    @Autowired
    UsuariosRepository usuariosRepository;
    @Autowired
    TarefasRepository tarefasRepository;


    @GetMapping
    public ResponseEntity<List<AvaliacaoModel>> ListarAvaliacoes (){
        return ResponseEntity.status(HttpStatus.OK).body(avaliacaoRepository.findAll());
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Object> BuscarAvaliacao (@PathVariable(value = "id") UUID id){
        Optional<AvaliacaoModel> buscandoAvaliacao = avaliacaoRepository.findById(id);

        if (buscandoAvaliacao.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Avaliação não encontrado");
        }

        return ResponseEntity.status(HttpStatus.OK).body(buscandoAvaliacao.get());
    }


    @PostMapping(consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Object> criarAvaliacao(@ModelAttribute @Valid AvaliacaoDTO avaliacaoDTO){

        AvaliacaoModel novoAvaliacao = new AvaliacaoModel();
        BeanUtils.copyProperties(avaliacaoDTO, novoAvaliacao);

        TipoUsuarioModel tipoUsuarioGestor = TipoUsuarioModel.GESTOR;
        TipoUsuarioModel tipoUsuarioCoordenador = TipoUsuarioModel.COORDENADOR;


        if (tipoUsuarioGestor != usuariosRepository.findById(UUID.fromString(avaliacaoDTO.usuario())).orElseThrow().getTipoUsuario() && tipoUsuarioCoordenador != usuariosRepository.findById(UUID.fromString(avaliacaoDTO.usuario())).orElseThrow().getTipoUsuario()){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Infelizmente você não pode cadastrar essa avaliação");
        }

        TarefasModel tarefaID = tarefasRepository.findById(UUID.fromString(avaliacaoDTO.tarefa())).orElseThrow();
        UsuarioModel usuarioID = usuariosRepository.findById(UUID.fromString(avaliacaoDTO.usuario())).orElseThrow();

        LocalDate dataAtual = LocalDate.now();

        novoAvaliacao.setData_avaliacao(dataAtual);
        novoAvaliacao.setId_usuario(usuarioID);
        novoAvaliacao.setId_tarefa(tarefaID);

        return ResponseEntity.status(HttpStatus.CREATED).body(avaliacaoRepository.save(novoAvaliacao));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deletarAvaliacao(@PathVariable(value = "id") UUID id){

        Optional<AvaliacaoModel> buscaAvaliacao = avaliacaoRepository.findById(id);

        if (buscaAvaliacao.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Avaliação não encontrado");
        }

        avaliacaoRepository.delete(buscaAvaliacao.get());
        return ResponseEntity.status(HttpStatus.OK).body("Avaliação deletado com sucesso!");

    }

}
