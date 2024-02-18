package com.gws.api.apigws.models;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
@Entity
@Getter
@Setter
@Table(name = "tb_demandas")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_demanda")
public class ListaUDemandasModel implements Serializable {

    @Id
    @GeneratedValue
    private UUID id_demanda;

    private String titulo;
    private String logo;
    private String descricao;
    private LocalDate data_inicio;
    private LocalDate data_final;
    private String anexo;

    @JsonIgnore
    @ManyToMany(mappedBy = "demandas")
    private Set<ListaUUsuariosModel> usuarios = new HashSet<>();

    @JsonIgnore
    @OneToMany(mappedBy = "demanda", cascade = CascadeType.REFRESH)
    private Set<TarefasInfoModel> tarefas;
}
