package com.gws.api.apigws.DTOs;

import com.gws.api.apigws.models.TipoUsuarioModel;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;

public record UsuariosDTOs(
        @NotBlank String nome,
        TipoUsuarioModel tipoUsuario,
        @NotBlank String sobrenome,
        @NotBlank String telefone,
        @NotBlank @Email String email,
        @NotBlank String senha,
        @NotBlank String dataDaferias,
        @NotBlank String designacao,
        @NotBlank String cidade,
        @NotBlank String estado,
        String horasDoDia,
        String entrada,
        String saida,
        String semanaTrabalhada,
        String mesTrabalhado,
        String anoTrabalhado,

        String descricao,

        List<String> id_demandas,
        List<String> id_hardskills,
        List<String> id_softSkills,

        MultipartFile foto

        ) {


}
