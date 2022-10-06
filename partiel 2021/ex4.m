function[]=Modele()
T=0.5;
N=100;
delta_t=T/N;
r0=0.1;
alpha=0.2;
beta=0.1;
omega=0.3;
sigma=0.5;
r(1)=r0;
Nmc=1000;
W(1)=0;
s0=10;
S(1)=s0;
cpt=0;
for k=1:Nmc
    for i=1:N
        W(i+1)=W(i)+sqrt(delta_t)*randn;
        r(i+1)=r(i)+(alpha-beta*r(i)*delta_t+omega*sqrt(r(i))*(W(i+1)-W(i)));
        S(i+1)=S(i) + S(i)*(r(i)*delta_t + sigma*(W(i+1)- W(i)));
    end
    if(S(N+1) < 500) %modifier le 500 par la valeur voulue
        cpt=cpt+1;
    end
    
last_value(k)=r(N+1);
plot(r);
plot(S);
hold on;
end

disp("proba : "+cpt/Nmc);
end