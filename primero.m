clc
clear
syms s
g=tf([6 44 120 100],[35 22 75 120 0 0]);
g2=tf([3 15 50 100],[35 22 75 120 0 0]);
step (g,30)
hold on
step (g2)