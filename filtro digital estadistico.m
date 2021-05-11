clear all
close all
clc
datos=[20 26 25 28 31 36 34 37 38 40 39 41 36 32];
stem(datos)
sum=0;
N=14
M=3;
ventana=zeros(1,M)
salida=zeros(1,N)
for i=1:N
    for j=1:m
        if ((i-j)<1 | (i+j)>(N+1))
            ventana(i)=0
        else
            ventana(i)= datos(i);
        end
    end
    salida(i)=mean (ventana);
end
stem(salida)