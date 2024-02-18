package com.gws.api.apigws.repositories;

import com.gws.api.apigws.models.ListaUUsuariosModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ListaUUsuariosRepository extends JpaRepository<ListaUUsuariosModel, UUID> {

}
