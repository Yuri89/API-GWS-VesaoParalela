package com.gws.api.apigws.controllers;

import com.gws.api.apigws.DTOs.HardSkillsDTOs;
import com.gws.api.apigws.DTOs.HorasTrabalhoDTOs;
import com.gws.api.apigws.models.DemandasModel;
import com.gws.api.apigws.models.HardSkillsModel;
import com.gws.api.apigws.models.HorasTrabalhoModel;
import com.gws.api.apigws.models.UsuarioModel;
import com.gws.api.apigws.repositories.HardSkillsRepository;
import com.gws.api.apigws.repositories.HorasTrabalhoRepository;
import com.gws.api.apigws.repositories.UsuariosRepository;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping(value = "/horastrabalho")
public class HorasTrabalhoController {

    @Autowired
    HorasTrabalhoRepository horasTrabalhoRepository;
    @Autowired
    UsuariosRepository usuariosRepository;

    @GetMapping
    public ResponseEntity<List<HorasTrabalhoModel>> ListarDiasEHorasTrabalhadas(){
        return ResponseEntity.status(HttpStatus.OK).body(horasTrabalhoRepository.findAll());
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Object> BuscarDiasEHorasTrabalhadas(@PathVariable(value = "id") UUID id){
        Optional<HorasTrabalhoModel> buscandoDiasEHorasTrabalhadas = horasTrabalhoRepository.findById(id);

        if (buscandoDiasEHorasTrabalhadas.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Dias e Horas Trabalhadas não encontrado");
        }


        return ResponseEntity.status(HttpStatus.OK).body(buscandoDiasEHorasTrabalhadas.get());
    }

    @PostMapping
    public ResponseEntity<Object> criarHorasTrabalho(@RequestBody @Valid HorasTrabalhoDTOs horasTrabalhoDTOs){
        LocalDate dia_registro = LocalDate.now();
        Optional<HorasTrabalhoModel> horasTrabalhoList = Optional.ofNullable(horasTrabalhoRepository.findByDiaRegistro(dia_registro));
        Optional<UsuarioModel> usuarioOptional = usuariosRepository.findById(UUID.fromString(horasTrabalhoDTOs.idUsuario()));

//          revisão de logica
//        if (!horasTrabalhoList.isEmpty() && usuarioOptional.isPresent()) {
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Dia já cadastrado para o usuário");
//        }

        HorasTrabalhoModel novaHorasTrabalho = new HorasTrabalhoModel();
        BeanUtils.copyProperties(horasTrabalhoDTOs, novaHorasTrabalho);

        novaHorasTrabalho.setHoras(Integer.parseInt(horasTrabalhoDTOs.horasString()));

        UUID id_usuario = UUID.fromString(horasTrabalhoDTOs.idUsuario());
        UsuarioModel usuario = new UsuarioModel();
        usuario.setId_usuario(id_usuario);
        novaHorasTrabalho.setIdUsuario(usuario);

        novaHorasTrabalho.setDiaRegistro(dia_registro);

        return ResponseEntity.status(HttpStatus.CREATED).body(horasTrabalhoRepository.save(novaHorasTrabalho));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Object> editarHorasTrabalho(@PathVariable(value = "id") UUID id, @RequestBody @Valid HorasTrabalhoDTOs horasTrabalhoDTOs){
        Optional<HorasTrabalhoModel> buscandoHorasTrabalho = horasTrabalhoRepository.findById(id);

        if (buscandoHorasTrabalho.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Dias e Horas Trabalhadas não encontrado");
        }

        HorasTrabalhoModel horasTrabalhoEditada = buscandoHorasTrabalho.get();
        BeanUtils.copyProperties(horasTrabalhoDTOs, horasTrabalhoEditada);


        return ResponseEntity.status(HttpStatus.CREATED).body(horasTrabalhoRepository.save(horasTrabalhoEditada));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> deletarHorasTrabalho(@PathVariable(value = "id") UUID id){

        Optional<HorasTrabalhoModel> horasTrabalhoBuscado = horasTrabalhoRepository.findById(id);

        if (horasTrabalhoBuscado.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Dias e Horas Trabalhadas encontrado");
        }

        horasTrabalhoRepository.delete(horasTrabalhoBuscado.get());
        return ResponseEntity.status(HttpStatus.OK).body("Dias e Horas Trabalhadas deletado com sucesso!");

    }
}
