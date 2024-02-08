package com.gws.api.apigws.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.util.UUID;

@Entity
@Getter
@Setter
@Table(name = "tb_usuarios")
public class ListaUsuariosModel implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    private UUID id_usuario;

}
