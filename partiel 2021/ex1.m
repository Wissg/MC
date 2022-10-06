disp("Exo 1: Partiel 2021");
VarWt();

function [] = VarWt()
T=3;
N=100;
delta_t=T/N;
Nmc=1000;
W(1)=0;
esp=0; var=0;
esp4=0;
t=(0:N)*delta_t;
for j=1: Nmc
    for i =1:N
    W(i+1) = W(i) + sqrt(delta_t)*randn;
    end
    last_value(j) = W(N+1);
    
    esp=esp+last_value(j);
    var=var+last_value(j)^2;
    esp4=esp4+last_value(j)^4;
    plot(t,W);
    hold on;
end
esp=esp/Nmc;
var=var/Nmc - esp^2;
esp4 = esp4/Nmc;
disp("esperance : "+esp);
disp("variance : " +var);
disp("esperance de (W)^4: "+ esp4);

end