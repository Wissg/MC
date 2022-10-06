disp("Exo 3 partiel");
Actif();
function[] = Actif()
T=0.5;
r0=0.3;
sig0=0.5;
s0=10;
N=100;
delta_t=T/N;
Nmc = 1000;
W(1)=0;
S(1)=s0;
r(1)=0;
sig(1)=0;
t=linspace(0,T,N+1);% ou t=(0:N)*delta_t;
Int(1)=0;
Int2(1)=0;

function[t]=rate(k)
    t=0.3*((k^2)/(0.5)^2);
end

function[t]=sigma(k)
    t=0.5*(k/0.5);
end

for k=1:Nmc
    for i=1:N
        W(i+1)=W(i)+sqrt(delta_t)*randn;
        S(i+1)=S(i) + S(i)*(rate(t(i))*delta_t + (sigma(t(i))*(W(i+1)-W(i))));
    end
plot(t, S);
hold on;
end

end