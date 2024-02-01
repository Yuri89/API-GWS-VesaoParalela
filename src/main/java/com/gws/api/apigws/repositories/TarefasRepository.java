package com.gws.api.apigws.repositories;

import com.gws.api.apigws.models.TarefasModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface TarefasRepository extends JpaRepository<TarefasModel, UUID> {
    TarefasModel findByNomeTarefa(String nomeTarefa);
}

