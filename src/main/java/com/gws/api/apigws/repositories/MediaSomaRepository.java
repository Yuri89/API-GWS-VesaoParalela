package com.gws.api.apigws.repositories;

import com.gws.api.apigws.models.MediaSomaModel;
import com.gws.api.apigws.models.UsuarioModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface MediaSomaRepository extends JpaRepository<MediaSomaModel, UUID> {

        MediaSomaModel findByIdUsuario(UsuarioModel usuario);

}
