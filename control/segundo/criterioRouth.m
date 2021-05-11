function [salida,pantalla,cortes]=criterioRouth(entrada)

%Para un polinomio entrada se calcula el coeficiente de Routh

%Primera linea de tabla
n=length(entrada);
syms E
Tabla=E;
pantalla=0;
cortes=0;
j=1;
for i=1:2:n,
    Tabla(1,j)=entrada(i);
    j=j+1;
end;
%Segunda linea de tabla
j=1;
for i=2:2:n,
    Tabla(2,j)=entrada(i);
    j=j+1;
end;
%Lineas siguientes
m=3;
temp=size(Tabla);
while (1),
    %Evitar denominadores con valor 0
    for i=1:(temp(2)-1),
        if Tabla(m-1,i)==0 && sum(Tabla(m-1,i+1:temp(2)))~=0,
           Tabla(m-1,i)=E;
        end;
    end;
    %Calculo de factores
    for i=1:(temp(2)-1),
        Tabla(m,i)=(Tabla(m-1,1)*Tabla(m-2,i+1)-Tabla(m-2,1)*Tabla(m-1,i+1))/Tabla(m-1,1);
    end;
    temp=size(Tabla);
    if sum(Tabla(temp(1),1:temp(2)))==0, %Si todos los coeficientes son cero
       if m-1==n, %Fin del programa
          break;
       else
          %Ecuacion auxiliar
          exponente=n-m+1;
          pantalla=exponente-1;
          ecuacion=[];
          for i=1:temp(2),
              if Tabla(m-1,i)~=0,
                 ecuacion=[ecuacion '+' char(Tabla(m-1,i)) '*x^' num2str(exponente)];
                 Tabla(m,i)=Tabla(m-1,i)*exponente;
                 exponente=exponente-2;
              else
                 break;
              end;
          end;
          cortes=solve([ecuacion '=0']);
       end;
    end;
    m=m+1;
end;

syms s
coef=[];
for i=(n-1):-1:0,
    coef=[coef; s^i];
end;

salida=[coef Tabla(1:n,:)];

