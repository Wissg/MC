Nmc = 100;
N = 100;

 Proprietes_MB(Nmc,N);
function[W] = MB()
T=2;
N=100;
delta_t=T/N;
W=zeros(N);
t=zeros(N);
for n=1:N
   W(n+1)=W(n)+sqrt(delta_t)*randn;
   t(n+1)=t(n)+sqrt(delta_t);
end
end

function[esperance,variance]=Proprietes_MB(Nmc,N)

esperance= 0;
var = 0;
last_value=zeros(Nmc);

for i =1:Nmc
    W=MB();
    last_value(i)=W(N);
    esperance=esperance+last_value(i);
    var=var+last_value(i)^2;
    plot(W);
    hold on;
end


esperance=esperance/Nmc;
variance=(var/Nmc) - esperance^2;

disp("Esperance: ");
disp(esperance);
disp("Variance: ");
disp(variance);



end


