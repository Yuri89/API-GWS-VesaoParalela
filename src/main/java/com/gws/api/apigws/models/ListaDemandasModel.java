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
@Table(name = "tb_demandas")
public class ListaDemandasModel implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    private UUID id_demanda;
    private String titulo;
    private String logo;
    private String descricao;



}