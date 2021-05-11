syms s t
%definio ecuacion 1
F1 = tf([1],[1 1.3 1]);
f1= F1
figure(1)
%dibuja la funcion f1
hold on
step(f1)
%definio ecuacion 2
F2= tf([1],[1 0.1 1]);
f2=F2
step(f2)
%definio ecuacion 3
F3= tf([1],[1 0.05 1]);
f3=F3
step(f3)
title('funciones de tranferencia')
legend('amortiguado','subamortiguado','criticamente amortiguado')





