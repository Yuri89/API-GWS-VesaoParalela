package com.gws.api.apigws.models;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Getter
@Setter
@Table(name = "tb_demandas")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_demanda")
public class ListaDemandasModel implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    private UUID id_demanda;
    private String titulo;
    private String logo;
    private String descricao;
    private String anexo;


    @ManyToMany
    @JoinTable(
            name = "tb_usuarios_demandas",
            joinColumns = @JoinColumn(name = "id_demanda",unique = false),
            inverseJoinColumns = @JoinColumn(name = "id_usuario",unique = false)

    )
    private Set<ListaUsuariosModel> id_usuario = new HashSet<>();


}