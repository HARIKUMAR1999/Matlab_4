clc;
clear all;
A = [0.5,0.5,0.7071;-0.5,-0.5,0.7071;-6.364,-0.7071,-8];
B = [0;0;4];
C = [0.7071,-0.7071,0];
D = 0;

sys = ss(A,B,C,D);
sysTF = tf(sys);
poles = roots([1 8 5 4]);

figure
pzplot(sys);

xnot = [1;2;0];
[y,ti,xi] = initial(sys,xnot);

figure
initial(sys,xnot);

figure
step(sys);

[ystep,ts,xs] = step(sys,ti);
ytot = y+ystep;

figure
plot(ytot);

t = 0:0.1:30;
u = 2.*exp(-t/10).*cos(2.*pi.*t);

figure
lsim(sys,u,t);

figure
lsim(sys,u,t,xnot);
