package com.gws.api.apigws.repositories;

import com.gws.api.apigws.models.ListaDemandasModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ListaDemandasRepository extends JpaRepository<ListaDemandasModel, UUID> {

}
