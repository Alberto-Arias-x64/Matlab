clear
clc
a=tf([1],[1]);
b=tf([1],[1 0]);
c=tf([1 5],[6 7 8 0]); %rampa
d=tf([1 5],[6 7 8]);  %escalon
step(a)
hold on
step(d)
hold on
step(b)
hold on
step(c,5)
hold on
grid