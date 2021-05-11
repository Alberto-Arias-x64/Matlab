clear all;
clc;
syms s x10 x20 x30 t;
A=[0 1 0;0 0 1;0 0 -2];
B=[0;0;3];
X0=[1;1;4];
I=[1 0 0;0 1 0;0 0 1];
SIMA=[s*I-A];
SIMAI=inv(SIMA);
TISIMAI=ilaplace(SIMAI);
XN= TISIMAI*X0;
BUT=B*[dirac(t)];
BUS=laplace(BUT);
SIMAIPORBU=SIMAI*BUS;
XF=ilaplace(SIMAIPORBU);
X=XN+XF
X1=X(1,:);
X2=X(2,:);
X3=X(3,:);
pretty(X1)
pretty(X2)
pretty(X3)
T=[0:0.01:3];
X1D=subs(X1,T);
X2D=subs(X2,T);
X3D=subs(X3,T);
plot(T,X1D)
hold on
plot(T,X2D)
hold on
plot(T,X3D)
hold on
grid on