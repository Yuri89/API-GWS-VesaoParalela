package gws.api.aplication;

import org.junit.jupiter.api.Test;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;


public class test {

    @Test
    public void test(){
        double numero = 10000d;

        if (numero >= 1000d){
            System.out.println("ultrapassou");
        }
    }
    @Test
    public void test2(){

        int[] numeros = {10,1,5,4,3};
        for (int numero = 0; numero <= numeros.length ; numero++){

            System.out.println(numero+" = numero ");
        }
    }
    @Test
    public void test3(){
        LocalDateTime data1 = LocalDateTime.parse("2022-01-01T00:00:00");
        LocalDateTime data2 = LocalDateTime.parse("2022-01-01T01:10:00");

        Duration diferenca = Duration.between(data1, data2);

        long diferencaEmHoras = diferenca.toHours();

    }

    @Test
    public void test4(){
        System.out.println(LocalDateTime.now());
    }
}
