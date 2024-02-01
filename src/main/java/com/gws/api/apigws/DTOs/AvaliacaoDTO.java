package com.gws.api.apigws.DTOs;

import com.gws.api.apigws.models.TarefasModel;
import com.gws.api.apigws.models.UsuarioModel;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record AvaliacaoDTO(
        @NotNull String relatorio,
        @NotNull @NotBlank String conceito,
        @NotNull @NotBlank String usuario,
        @NotNull  @NotBlank String tarefa
) {
}
