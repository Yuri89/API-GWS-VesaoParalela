package com.gws.api.apigws.DTOs;

import com.gws.api.apigws.models.DemandasModel;
import com.gws.api.apigws.models.TipoConclusao;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotBlank;

import java.util.UUID;

public record TarefasDTOs(
        @NotBlank String nomeTarefa,
        @NotBlank String descricao_tarefa,
        TipoConclusao conclusao,

        @NotBlank String idDemanda
) {
}
