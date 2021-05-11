clc
clear
syms s;
num=(6*s^3)+(44*s^2)+(120*s)+(100);
den=(3*s^5)+(22*s^4)+(75*s^3)+(120*s^2);
g=num/den;
a=ilaplace(g);
pretty (a)