disp (pas());
Martingale();
function[p] = pas()
if rand() < 1/2
    p = 1;
else
    p = -1;
end 
end

function [M_fk,M] = Processus_M(K)
M(1) = 0;
for i =1:K-1
    M(i+1) = M(i) + pas();
end
plot(M);
M_fk = M(K);
end

function [] = Martingale()
Nmc=20;
K = 100;
n = 300; 
[M_fk,M] = Processus_M(K);

clc;
for j = 1 : Nmc
    for i = K:n-1
        M(i+1) = M(i) + pas();
    end
last_valeur(j) = M(n);
end


esperance = mean(last_valeur);
disp('esperance');
disp(esperance);
disp('M(k)');
disp(M_fk);
end