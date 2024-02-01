package com.gws.api.apigws.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Getter
@Setter
@Table(name = "tb_avaliacoes")
public class AvaliacaoModel implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id_avaliacao;
    private String relatorio;
    private String conceito;
    private LocalDate data_avaliacao;

    @ManyToOne
    @JoinColumn(name = "id_usuario", referencedColumnName = "id_usuario")
    private UsuarioModel id_usuario;

    @ManyToOne
    @JoinColumn(name = "id_tarefa", referencedColumnName = "id_tarefa")
    private TarefasModel id_tarefa;
}