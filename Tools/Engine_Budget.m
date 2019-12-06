clc; clear all;
M0 = [505846];
Ms = [19000];
ISP = [311];
tbo = [180];
En = [120];
T = 6672000;
T_W_Eng = 150;

g0 = 9.81;


Mp = T * tbo / ISP / g0;

T = ISP .* Mp .*g0 ./ tbo;

Me = T / T_W_Eng /g0;

Ke = Me./Ms;