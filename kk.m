clc
clear
for cita = 0.1: 0.05: 1.3
k=1
w_n=2
num=[k*w_n^2]
den=[1 2*cita*w_n w_n^2]
g=tf(num,den)
%p=roots(den)
step(g,20)
hold on
grid
end
title('funciones de tranferencia')