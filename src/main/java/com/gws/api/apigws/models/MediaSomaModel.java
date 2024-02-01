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
@Table(name = "tb_media_soma")
public class MediaSomaModel implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_media_soma")
    private UUID id_media_soma;

    private int media_semanal;
    private int media_mensal;
    private int media_anual;

    private int  total_semanal;
    private int  total_mensal;
    private int  total_anual;

    private int fte_medio_semanal;
    private int fte_medio_mensal;
    private int fte_medio_anual;

    private LocalDate registro;

    @ManyToOne
    @JoinColumn(name = "id_usuario",referencedColumnName = "id_usuario")
    private UsuarioModel idUsuario;

}
