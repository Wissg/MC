clc;
lambda = 4;
T=0.5;
N=100;
Nmc=100;
sigma=0.5;
a=0.5;
b=0.5;
r=0.1;
t = linspace(0,T,N+1);
delta_t=T/N;
%portefeuille();
Trajectoire(N,sigma,delta_t,lambda,a,b,r,t);

function[Nt]= Nombre_sauts(t,lambda)
n=0;
Tau=0;
while Tau <= t
    F=-log(rand())/lambda;
    Tau=Tau+F;
    n=n+1;
    disp(Tau);
    disp(t);
end
Nt=n-1;
end

function[Esp] = portefeuille()
lambda = 25;
T=0.5;
N=100;
Nmc=100;

t = 2;
for k = 1:Nmc
    [Nt]=Nombre_sauts(t,lambda);
 
   % plot(t,X)
   % hold on;
    %plot(t,P)
    %hold on;
    %plot(t,M)
    last_value(k)=Nt;
end
nbrsaut=(sum(last_value));
Esp = mean(last_value);
var = (std(last_value))^2;
disp('Esparance :');

disp(Esp);

disp(t*lambda);

disp('Variance');
disp(var);
disp('nbr saut');
disp(nbrsaut);
end

function[Amp]=amplitude(t,lambda)
a= 0.5;
f=0.5;
Amp=1;
Ns=Nombre_sauts(t,lambda);
for j=1:Ns
    if randn <= 0.5
        Y=a;
    else
        Y=-f;
    end
    Amp=Amp*(1+Y);
end
disp('nbr sauts');
disp(Ns);
end

function[S] = Trajectoire(N,sigma,delta_t,lambda,a,b,r,t)
S(1) = 10;
mu = r - (lambda*delta_t*((a-b)/2));
    for i=1:N
        S(i+1) = S(i)* exp((mu - (sigma^2)/2)*delta_t + sqrt(delta_t)*randn)*amplitude(delta_t,lambda);
    end
plot(t,S)
end



