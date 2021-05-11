function H=H_r2gdl()
syms  q1 q2 beta1 beta2 l1 l2  alpha1 alpha2 real
disp('Parámetros Denavit-Hartenberg del robot planar vertical de 2 gdl')
disp('[ l  alpha d   q]')
dh=[l1, 0, beta1, q1; l2, 0, beta2, q2]; 
disp(dh)
%$H10=HDH{0}{q_1}{beta_1}{l_1}{0}
H10=HRz(q1)*HTz(beta1)*HTx(l1)*HRx(0) 
%$H21=HDH{0}{q_2}{beta_2}{l_2}{0}
H21=HRz(q2)*HTz(beta2)*HTx(l2)*HRx(0)
H20=simplify(H10*H21); %H20=H10 H21
[R20, cinemat_r2gdl, cero, c]=H_DH(H20)
 H=[R20, cinemat_r2gdl; %R20(q_1,q_2), f_R(q_1,q_2)
      cero,  c];
end