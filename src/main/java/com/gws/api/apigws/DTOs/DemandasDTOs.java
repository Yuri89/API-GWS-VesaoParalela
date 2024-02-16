package com.gws.api.apigws.DTOs;

import com.gws.api.apigws.models.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.UUID;

public record DemandasDTOs(
        @NotBlank String titulo,
        @NotBlank String descricao,
        TipoPrioridadeModel prioridade,
        @NotNull Boolean privacidade,
        TipoStatusModel status,
        @NotBlank String data_inicio,
        @NotBlank String data_final,
        @NotNull Double custo,
        List<MultipartFile> copy_anexo,

        List<String> id_segmento,
        UUID id_cliente,
        UUID id_lider,
        List<String> id_usuario,
        List<String> id_hard,
        List<String> id_soft


) {

}
