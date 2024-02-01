package com.gws.api.apigws.DTOs;

import com.gws.api.apigws.models.UsuarioModel;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;

import java.time.LocalDate;
import java.util.UUID;

public record HorasTrabalhoDTOs(

        @NotBlank String horasString,

        @NotBlank String idUsuario
) {
}
