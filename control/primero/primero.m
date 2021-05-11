clc
clear
syms s;
g1=(1/(s+1));
g2=(1/(s+2));
g3=(1/(s+3));
g4=(1/(s+4));
g5=(1/(s+5));
g6=(1/(s+6));
ans=((g1*g2*g3)+(g1*g4))/(1+(g1*g2*g3)+(g1*g4)+(g1*g2*g6)-(g2*g3*g5)-(g4*g5));
simplify(ans);
pretty(ans)