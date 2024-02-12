package com.gws.api.apigws.services;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@Service
public class FileUploadService {
    private final Path diretorioImg = Paths.get(System.getProperty("user.dir") + "\\src\\main\\resources\\static\\img");
    public Path getDiretorioImg() {
        return diretorioImg;
    }


    private final Path diretorioAnx = Paths.get(System.getProperty("user.dir") + "\\src\\main\\resources\\static\\anexos");
    public Path getDiretorioAnx() {return diretorioAnx;}

    public String fazerUpload(MultipartFile imagem) throws IOException {
        if (imagem.isEmpty()){
            System.out.println("imagem vazia");
            return null;
        }

            String[] nomeArquivoArray = imagem.getOriginalFilename().split("\\."); // NomeArquivo.png
            String novoNome = LocalDateTime.now().format(DateTimeFormatter.ofPattern("ddMMyyyyHHmmss"));
            String extensaoArquivo = nomeArquivoArray[nomeArquivoArray.length - 1];

            String nomeImagem = novoNome + "." + extensaoArquivo;

            File imagemCriada = new File(diretorioImg + "\\" + nomeImagem);

            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(imagemCriada));

            stream.write(imagem.getBytes());
            stream.close();

            return nomeImagem;

    }

    public String fazerMultiploUpload(MultipartFile anexo, String nomeDemanda  , int anexoN) throws IOException {
        if (anexo.isEmpty()){
            System.out.println("anexo vazia");
            return null;
        }

        String[] nomeArquivoArray = anexo.getOriginalFilename().split("\\."); // NomeArquivo.png
        String novoNome = LocalDate.now().format(DateTimeFormatter.ofPattern("ddMMyyyy"));
        String extensaoArquivo = nomeArquivoArray[nomeArquivoArray.length - 1];

        String nomeAnexo = nomeDemanda+anexoN+"("+novoNome+")"+ "." + extensaoArquivo;

        File imagemCriada = new File(diretorioAnx+ "\\" +nomeAnexo);

        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(imagemCriada));

        stream.write(anexo.getBytes());
        stream.close();

        return nomeAnexo;
    }

    public void excluirArquivo(String arquivo) throws IOException{

        File arquivoSelecionado = new File(arquivo);

        if (arquivoSelecionado.exists()){
            arquivoSelecionado.delete();
        }

    }

    public MultipartFile fazeLeituraImagem(String caminhoImagem) throws IOException {
        // Verifica se o caminho é um caminho completo no sistema de arquivos
        String caminhoCompleto = "/static/img/"+caminhoImagem;

        InputStream inputStream;

            // Ler a imagem do classpath
            Resource resource = new ClassPathResource(caminhoCompleto);
            System.out.println(resource.getDescription());
            inputStream = resource.getInputStream();


        // Lê os bytes da imagem
        byte[] bytes = StreamUtils.copyToByteArray(inputStream);

        // Cria um MultipartFile a partir dos bytes da imagem
        return (MultipartFile) new ByteArrayResource(bytes).getFile();
    }

}