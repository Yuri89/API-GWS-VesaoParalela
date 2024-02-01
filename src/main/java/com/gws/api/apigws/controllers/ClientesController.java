package com.gws.api.apigws.controllers;

import com.gws.api.apigws.models.UsuarioModel;
import com.gws.api.apigws.services.FileUploadService;
import com.gws.api.apigws.DTOs.ClientesDTOs;
import com.gws.api.apigws.models.ClientesModel;
import com.gws.api.apigws.repositories.ClientesRepository;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping(value = "/clientes", produces = {"application/json"})
public class ClientesController {

    @Autowired
    ClientesRepository clientesRepository;

    @Autowired
    FileUploadService fileUploadService;

    @GetMapping
    public ResponseEntity<List<ClientesModel>> ListarClientes(){

        for (ClientesModel clientes : clientesRepository.findAll()) {
            String fileFoto = fileUploadService.getDiretorioImg().toString();
            String strFoto = clientes.getUrl_img();

            String linkFoto = fileFoto+strFoto;
            clientes.setUrl_img(linkFoto);
        }

        return ResponseEntity.status(HttpStatus.OK).body(clientesRepository.findAll());
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity<Object> BuscarCliente(@PathVariable(value = "id") UUID id){
        Optional<ClientesModel> buscandoCliente = clientesRepository.findById(id);

        if (buscandoCliente.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
        }


        String fileFoto = fileUploadService.getDiretorioImg().toString();
        ClientesModel cliente = buscandoCliente.get();
        String strFoto = cliente.getUrl_img();

        String linkFoto = fileFoto+strFoto;
        cliente.setUrl_img(linkFoto);

        return ResponseEntity.status(HttpStatus.OK).body(buscandoCliente.get());
    }


    @PostMapping(consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<Object> criarCliente(@ModelAttribute @Valid ClientesDTOs clientesDTOs){
        if (clientesRepository.findByEmail(clientesDTOs.email()) != null){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Cliente já cadastrado");
        }

        ClientesModel novoCliente = new ClientesModel();
        BeanUtils.copyProperties(clientesDTOs, novoCliente);


        String urlImagem;

        try{
            urlImagem = fileUploadService.fazerUpload(clientesDTOs.image());
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        novoCliente.setUrl_img(urlImagem);

        return ResponseEntity.status(HttpStatus.CREATED).body(clientesRepository.save(novoCliente));
    }
    @PutMapping("/{id}")
    public ResponseEntity<Object> editarCliente(@PathVariable(value = "id") UUID id, @RequestBody @Valid ClientesDTOs clientesDTOs){
        Optional<ClientesModel> buscandoCliente = clientesRepository.findById(id);

        if (buscandoCliente.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
        }

        ClientesModel clienteEditado = buscandoCliente.get();
        BeanUtils.copyProperties(clientesDTOs, clienteEditado);


        String urlImagem;

        try{
            urlImagem = fileUploadService.fazerUpload(clientesDTOs.image());
        }catch (IOException e){
            throw new RuntimeException(e);
        }

        clienteEditado.setUrl_img(urlImagem);

        return ResponseEntity.status(HttpStatus.CREATED).body(clientesRepository.save(clienteEditado));
    }

    @DeleteMapping("/{idCliente}")
    public ResponseEntity<Object> deletarCliente(@PathVariable(value = "idCliente") UUID id){

        Optional<ClientesModel> clienteBuscado = clientesRepository.findById(id);

        if (clienteBuscado.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Cliente não encontrado");
        }

        String link1 = clienteBuscado.get().getUrl_img();
        String link2 = String.valueOf(fileUploadService.getDiretorioImg());

        try {
            fileUploadService.excluirArquivo(link2+link1);
        }catch (IOException e){
            throw new RuntimeException(e);
        }


        clientesRepository.delete(clienteBuscado.get());
        return ResponseEntity.status(HttpStatus.OK).body("Cliente deletado com sucesso!");

    }

}


