package com.gws.api.apigws.repositories;

import com.gws.api.apigws.models.ListaUDemandasModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ListaUDemandasRepository extends JpaRepository<ListaUDemandasModel, UUID> {

}
