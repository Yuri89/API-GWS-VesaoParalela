package com.gws.api.apigws.models;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.*;

// Faltando A designação do usuario

@Getter
@Setter
@Entity
@Table(name = "tb_usuarios")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id_usuario")
 public class UsuarioModel implements Serializable, UserDetails {

   @Serial
   private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_usuario", nullable = false)
    private UUID id_usuario;
    private String nome;
    @Column(name = "tipo_usuario")
    private TipoUsuarioModel tipoUsuario;
    private String sobrenome;
    private String telefone;
    private String email;
    @JsonIgnore
    private String senha;
    private LocalDateTime data_cadastro;
    private LocalDate data_ferias;
    private String designacao;
    private String cidade;
    private String estado;
    private LocalTime horas;
    @Column(name = "semana_trabalhada")
    private Integer semanaTrabalhada;
    @Column(name = "mes_trabalhado")
    private Integer mesTrabalhado;
    @Column(name = "ano_trabalhado")
    private Integer anoTrabalhado;
    private String descricao;
    private String url_img;

    @JsonIgnore
    @ManyToMany
    @JoinTable(
        name = "tb_softskills_usuarios",
        joinColumns = @JoinColumn(name = "id_usuario",unique = false),
       inverseJoinColumns = @JoinColumn(name = "id_softskill",unique = false)
    )
    @org.hibernate.annotations.Index(name = "idx_softskills_usuario")
    private Set<SoftSkillsModel> id_softskill = new HashSet<>();

    @JsonIgnore
    @ManyToMany
    @JoinTable(
         name = "tb_hardskills_usuarios",
         joinColumns = @JoinColumn(name = "id_usuario",unique = false),
         inverseJoinColumns = @JoinColumn(name = "id_hardskill",unique = false)
    )
    @org.hibernate.annotations.Index(name = "idx_hardskills_usuario")
    private Set<HardSkillsModel> id_hardskill = new HashSet<>();

     @ManyToMany(mappedBy = "id_usuarios")
     private Set<DemandasModel> id_demandas = new HashSet<>();



 @JsonIgnore
     @Override
     public Collection<? extends GrantedAuthority> getAuthorities(){
      if (this.tipoUsuario == TipoUsuarioModel.ADMIN){
       return List.of(
               new SimpleGrantedAuthority("ROLE_ADMIN"),
               new SimpleGrantedAuthority("ROLE_GESTOR"),
               new SimpleGrantedAuthority("ROLE_COORDENADOR"),
               new SimpleGrantedAuthority("ROLE_CONSULTOR")
       );
      } else if (this.tipoUsuario == TipoUsuarioModel.GESTOR) {
       return List.of(
               new SimpleGrantedAuthority("ROLE_GESTOR")
       );
      } else if (this.tipoUsuario == TipoUsuarioModel.COORDENADOR) {
       return List.of(
               new SimpleGrantedAuthority("ROLE_COORDENADOR")
       );

      } else if (this.tipoUsuario == TipoUsuarioModel.CONSULTOR) {
       return List.of(
               new SimpleGrantedAuthority("ROLE_CONSULTOR")
      );

      }
      return null;
     }

      @JsonIgnore
      @Override
      public String getPassword() {
       return senha;
      }

      @JsonIgnore
      @Override
      public String getUsername() {
       return email;
      }
      @JsonIgnore
      @Override
      public boolean isAccountNonExpired() {
       return true;
      }

      @JsonIgnore
      @Override
      public boolean isAccountNonLocked() {
       return true;
      }

      @JsonIgnore
      @Override
      public boolean isCredentialsNonExpired() {
       return true;
      }

      @JsonIgnore
      @Override
      public boolean isEnabled() {
       return true;
      }


}
