package com.gws.api.apigws.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Getter
@Setter
@Table(name = "tb_tarefas")
public class TarefasModel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_tarefa", nullable = false)
    private UUID id_tarefa;
    @Column(name = "nome_tarefa")
    private String nomeTarefa;
    private String descricao_tarefa;
    private TipoConclusao conclusao;

    @ManyToOne
    @JoinColumn(name = "id_demanda", referencedColumnName = "id_demanda")
    private DemandasModel id_demanda;


}
