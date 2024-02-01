package com.gws.api.apigws.controllers;


import com.gws.api.apigws.models.HorasTrabalhoModel;
import com.gws.api.apigws.models.MediaSomaModel;
import com.gws.api.apigws.models.SoftSkillsModel;
import com.gws.api.apigws.repositories.MediaSomaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping(value = "/mediasoma")
public class MediaSomaController {

    @Autowired
    MediaSomaRepository mediaSomaRepository;

    @GetMapping
    public ResponseEntity<List<MediaSomaModel>> listarMediaSoma(){
        return ResponseEntity.status(HttpStatus.OK).body(mediaSomaRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> listarMediaSoma(@PathVariable(value = "id") UUID id){

        Optional<MediaSomaModel> buscandoId =  mediaSomaRepository.findById(id);

        if (buscandoId.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Usuario não encontrado");
        }

        return ResponseEntity.status(HttpStatus.OK).body(buscandoId.get());
    }


}
