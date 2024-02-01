package com.gws.api.apigws.services;

import com.gws.api.apigws.models.HorasTrabalhoModel;
import com.gws.api.apigws.models.MediaSomaModel;
import com.gws.api.apigws.models.UsuarioModel;
import com.gws.api.apigws.repositories.HorasTrabalhoRepository;
import com.gws.api.apigws.repositories.MediaSomaRepository;
import com.gws.api.apigws.repositories.UsuariosRepository;
import org.hibernate.validator.constraints.Range;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.WeekFields;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CalcularSemMesAnoService {

    @Autowired
    HorasTrabalhoRepository horasTrabalhoRepository;
    @Autowired
    MediaSomaRepository mediaSomaRepository;

    @Autowired
    UsuariosRepository usuariosRepository;

    MediaSomaModel ms = new MediaSomaModel();

    public int CalculoSemanal(LocalDateTime entrada, LocalDateTime saida){
        Duration diferenca = Duration.between(entrada, saida);

        long diferencaEmHoras = diferenca.toHours();

        return (int) diferencaEmHoras;
    }

    @Scheduled(cron = "0 0 15 ? * SUN") // Executa no último dia da semana à 23:59
    public void CalculoSemanal() {
        List<HorasTrabalhoModel> usuarios = horasTrabalhoRepository.findAll();

        for (HorasTrabalhoModel horasTrabalho : usuarios) {
            UUID usuarioId = horasTrabalho.getIdUsuario().getId_usuario();
            LocalDate date = LocalDate.now();
            LocalDate primeiroDiaDaSemana = date.with(WeekFields.of(DayOfWeek.of(1), 1).dayOfWeek(), 1);

            int valor = 0;
            int numeroDedias = 0;

            for (LocalDate i = date; !i.isBefore(primeiroDiaDaSemana); i = i.minusDays(1)) {
                UsuarioModel usuario = usuariosRepository.findById(usuarioId).orElse(null);
                HorasTrabalhoModel horasTrabalhoModel = horasTrabalhoRepository.findByIdUsuarioAndDiaRegistro(usuario, i);

                if (horasTrabalhoModel != null) {
                    valor += horasTrabalhoModel.getHoras();
                    numeroDedias++;
                }
            }

            int media = (numeroDedias > 0) ? (valor / numeroDedias) : 0;

            MediaSomaModel msBusca = mediaSomaRepository.findByIdUsuario(horasTrabalho.getIdUsuario());
            MediaSomaModel ms = new MediaSomaModel();

            if (msBusca != null) {
                ms = msBusca;

                ms.setMedia_semanal(media);
                ms.setTotal_semanal(valor);

                mediaSomaRepository.save(ms);
            }else {
                ms.setIdUsuario(horasTrabalho.getIdUsuario());
                ms.setMedia_semanal(media);
                ms.setTotal_semanal(valor);

                mediaSomaRepository.save(ms);
            }
        }
    }


    @Scheduled(cron = "0 59 23 L * ?") // Executa no último dia do mês à 23:59
    public void CalculoMensal() {
        List<HorasTrabalhoModel> usuarios = horasTrabalhoRepository.findAll();

        for (HorasTrabalhoModel horasTrabalho : usuarios) {
            UUID usuarioId = horasTrabalho.getIdUsuario().getId_usuario();
            LocalDate date = LocalDate.now();
            LocalDate primeiroDiaDoMes = LocalDate.of(date.getYear(), date.getMonth(), 1);

            int valor = 0;
            int numeroDedias = 0;

            for (LocalDate i = date; !i.isBefore(primeiroDiaDoMes); i = i.minusDays(1)) {
                UsuarioModel usuario = usuariosRepository.findById(usuarioId).orElse(null);
                HorasTrabalhoModel horasTrabalhoModel = horasTrabalhoRepository.findByIdUsuarioAndDiaRegistro(usuario, i);

                if (horasTrabalhoModel != null) {
                    valor += horasTrabalhoModel.getHoras();
                    numeroDedias++;
                }
            }

            int media = (numeroDedias > 0) ? (valor / numeroDedias) : 0;

            MediaSomaModel msBusca = mediaSomaRepository.findByIdUsuario(horasTrabalho.getIdUsuario());
            MediaSomaModel ms = new MediaSomaModel();

            if (msBusca != null) {
                ms = msBusca;

                ms.setMedia_mensal(media);
                ms.setTotal_mensal(valor);

                mediaSomaRepository.save(ms);
            }else {
                ms.setIdUsuario(horasTrabalho.getIdUsuario());
                ms.setMedia_mensal(media);
                ms.setTotal_mensal(valor);

                mediaSomaRepository.save(ms);
            }
        }
    }

    @Scheduled(cron = "0 59 23 L 12 ?") // Executa no último dia do ano à 23:59
    public void CalculoAnual() {
        List<HorasTrabalhoModel> usuarios = horasTrabalhoRepository.findAll();

        for (HorasTrabalhoModel horasTrabalho : usuarios) {
            UUID usuarioId = horasTrabalho.getIdUsuario().getId_usuario();
            LocalDate date = LocalDate.now();
            LocalDate primeiroDiaDoAno = LocalDate.of(date.getYear(),1,1);

            int valor = 0;
            int numeroDedias = 0;

            for (LocalDate i = date; !i.isBefore(primeiroDiaDoAno); i = i.minusDays(1)) {
                UsuarioModel usuario = usuariosRepository.findById(usuarioId).orElse(null);
                HorasTrabalhoModel horasTrabalhoModel = horasTrabalhoRepository.findByIdUsuarioAndDiaRegistro(usuario, i);

                if (horasTrabalhoModel != null) {
                    valor += horasTrabalhoModel.getHoras();
                    numeroDedias++;
                }
            }

            int media = (numeroDedias > 0) ? (valor / numeroDedias) : 0;

            MediaSomaModel msBusca = mediaSomaRepository.findByIdUsuario(horasTrabalho.getIdUsuario());
            MediaSomaModel ms = new MediaSomaModel();

            if (msBusca != null) {
                ms = msBusca;

                ms.setMedia_anual(media);
                ms.setTotal_anual(valor);

                mediaSomaRepository.save(ms);
            }else {
                ms.setIdUsuario(horasTrabalho.getIdUsuario());
                ms.setMedia_anual(media);
                ms.setTotal_anual(valor);

                mediaSomaRepository.save(ms);
            }
        }
    }


}
