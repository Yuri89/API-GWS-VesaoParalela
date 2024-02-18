package com.gws.api.apigws.models;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
@Table(name = "tb_usuarios")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_usuario")
public class ListaUUsuariosModel implements Serializable {

    @Id
    @GeneratedValue
    private UUID id_usuario;

    private String nome;
    private String sobrenome;
    private String designacao;
    private String url_img;

    @JsonIgnore
    @ManyToMany
    @JoinTable(
            name = "tb_usuarios_demandas",
            joinColumns = @JoinColumn(name = "id_usuario"),
            inverseJoinColumns = @JoinColumn(name = "id_demanda")
    )
    private Set<ListaUDemandasModel> demandas = new HashSet<>();
}