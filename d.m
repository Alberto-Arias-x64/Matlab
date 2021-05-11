clc
clear all
a=5
k=3.64
tao=1.37
time=[0:0,05:10];
y=a*k*(1-exp(-time/tao))
plot(time,y)
grid