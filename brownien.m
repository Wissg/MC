T = 2;
N = 100;
delta_t = T/N;
Nmc = 10000;
[esperance,var] = Propriete_MB(Nmc,N,delta_t);

function[W,t] = MB(N,delta_t)
W = zeros(N);
t = zeros(N);
W(1) = 0;
for n = 1:N
    W(n+1) = W(n) + sqrt(delta_t) * randn;
    t(n+1) = t(n) + delta_t;
end
plot(t,W);
end

function[esperance,var] = Propriete_MB(Nmc,N,delta_t)
esperance = 0;
esperance_2 = 0;
last_value = zeros(Nmc);
for i = 1:Nmc
    [W,~] = MB(N,delta_t);
    last_value(i) = W(Nmc);
    esperance = esperance + last_value (i);
    esperance_2 = esperance_2 + (last_value(i))^2;
end
esperance = esperance/Nmc;
var = esperance_2/Nmc-esperance^2;
disp ("L'esperance vaut");
disp(esperance);
disp("La variance vaut");
disp(var);
disp(delta_t*N);
end