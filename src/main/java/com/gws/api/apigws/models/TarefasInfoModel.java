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
public class TarefasInfoModel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    private UUID id_tarefa;
    private TipoConclusao conclusao;

    @ManyToOne
    @JoinColumn(name = "id_demanda")
    private ListaDemandasModel demanda;


}