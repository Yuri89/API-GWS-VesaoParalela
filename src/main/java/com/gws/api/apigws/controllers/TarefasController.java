package com.gws.api.apigws.controllers;

import com.gws.api.apigws.DTOs.TarefasDTOs;
import com.gws.api.apigws.models.DemandasModel;
import com.gws.api.apigws.models.TarefasModel;
import com.gws.api.apigws.repositories.DemandasRepository;
import com.gws.api.apigws.repositories.TarefasRepository;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping(value = "/tarefas")
public class TarefasController {

    @Autowired
    TarefasRepository tarefasRepository;
    @Autowired
    DemandasRepository demandasRepository;

    @GetMapping
    public ResponseEntity<List<TarefasModel>> listarTarefas(){
        return ResponseEntity.status(HttpStatus.OK).body(tarefasRepository.findAll());
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Object> BuscarTarefa(@PathVariable(value = "id") UUID id){
        Optional<TarefasModel> buscandoTarefa = tarefasRepository.findById(id);

        if (buscandoTarefa.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Tarefa não encontrado");
        }


        return ResponseEntity.status(HttpStatus.OK).body(buscandoTarefa.get());
    }

    @PostMapping
    public ResponseEntity<Object> criarCliente(@RequestBody @Valid TarefasDTOs tarefasDTOs){
        if (tarefasRepository.findByNomeTarefa(tarefasDTOs.nomeTarefa()) != null){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Tarefa já cadastrado");
        }


        TarefasModel novaTarefa = new TarefasModel();
        BeanUtils.copyProperties(tarefasDTOs, novaTarefa);

        UUID id_demanda = UUID.fromString(tarefasDTOs.idDemanda());
        DemandasModel demanda = new DemandasModel();
        demanda.setId_demanda(id_demanda);
        novaTarefa.setId_demanda(demanda);

        return ResponseEntity.status(HttpStatus.CREATED).body(tarefasRepository.save(novaTarefa));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Object> editarTarefa(@PathVariable(value = "id") UUID id, @RequestBody @Valid TarefasDTOs tarefasDTOs){
        Optional<TarefasModel> buscandoTarefa = tarefasRepository.findById(id);

        if (buscandoTarefa.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Tarefa não encontrado");
        }

        TarefasModel tarefaEditada = buscandoTarefa.get();
        BeanUtils.copyProperties(tarefasDTOs, tarefaEditada);


        return ResponseEntity.status(HttpStatus.CREATED).body(tarefasRepository.save(tarefaEditada));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deletarTarefa(@PathVariable(value = "id") UUID id){

        Optional<TarefasModel> tarefaBuscado = tarefasRepository.findById(id);

        if (tarefaBuscado.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Tarefa não encontrado");
        }

        tarefasRepository.delete(tarefaBuscado.get());
        return ResponseEntity.status(HttpStatus.OK).body("Tarefa deletado com sucesso!");

    }

}
