package com.gws.api.apigws.repositories;

import com.gws.api.apigws.models.HorasTrabalhoModel;
import com.gws.api.apigws.models.UsuarioModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface HorasTrabalhoRepository extends JpaRepository<HorasTrabalhoModel, UUID> {

    HorasTrabalhoModel findByDiaRegistro(LocalDate data);

    HorasTrabalhoModel findByIdUsuarioAndDiaRegistro(UsuarioModel usuario, LocalDate diaRegistro);

}
