package com.gws.api.apigws.repositories;

import com.gws.api.apigws.models.ListaUsuariosModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ListaUsuariosRepository extends JpaRepository<ListaUsuariosModel, UUID> {

}
