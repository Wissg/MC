disp("Exo 2 du partiel");
%IntStochastique();
Stoch();
function[] = IntStochastique()
T=3;
N=100;
delta_t=T/N;
Nmc = 1000;
W(1)=0;
I1=0;
I2=0;
esp=0;

for i =1:N
    W(i+1)=W(i)+sqrt(delta_t)*randn;
    I1=I1+(W(i)^2)*(W(i+1)-W(i));
    I2=I2+W(i)*(delta_t);
end

I1 = I1;
I2=W(N+1)^3/3 - I2;

disp("Integrale 1: "+I1);
disp("Integrale 2: "+I2);
disp("Difference :"+abs(I1-I2));
end