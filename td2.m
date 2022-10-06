tetao = 0.6;
portefeuille(tetao)
%Optimisation()





function[Esp,M] = portefeuille(tetao)
r = 0.07;
T=1;
mu = 0.12;
sigma1 = 0.3;
sigma2 = 0.4;
p = 2;
lambda = 0.005;
W(1) = 0;
Xo = 100;
Mo = 500;
Po = 100;
N=100;
Nmc = 10000;
delta_t = T/N;
compteur =0;
M(1) = Mo;
X(1) = Xo;
P(1) = Po;
t = linspace(0,T,N+1);
for k = 1:Nmc
    for i=1:N 
        W(i+1) = W(i) + sqrt(delta_t)*randn;
        X(i+1) = -p*X(i)*delta_t + sigma2*(W(i+1)-W(i)) + X(i);
        P(i+1) = P(i)*((mu + lambda*X(i))*delta_t + sigma1*(W(i+1) - W(i))) + P(i);
        M(i+1) = M(i)*( (tetao*((P(i+1)-P(i) )/P(i)) + (1-tetao)*r*delta_t)) + M(i);
    end
    Wealth_final(k) = M(N+1);
    if Wealth_final(k) < 800
          compteur = compteur +1;
    end
   % plot(t,X)
   % hold on;
    %plot(t,P)
    %hold on;
    %plot(t,M)
    last_value(k)=M(N+1);
end
Esp = mean(log(Wealth_final));
proba = compteur/Nmc;
disp(proba)
a=0;
densite_Emp_graphe(a,1.5,last_value);
repartition_graphe(a,1.5,last_value);
end

function[] = Optimisation()
for j=1:21
    tetao(j) = (j-1)/20;
    [Esp(j),M] = portefeuille(tetao(j));
end 
hold off
plot(tetao,Esp);
end

function[P,x]=fonction_repartition(X,a,delta)
N_x=length(X);
for i =1:N_x+1
    x(i)=a+delta*(i-1);
    cont=0;
    for n=1:length(X)
        if X(n)<=x(i)
            cont=cont+1;
        end
    end
    P(i)=cont/(length(X));
end
end

function[]=repartition_graphe(a,delta,X)
tic;
[P,x]=fonction_repartition(X,a,delta)
figure;
plot(x,P,'ro','MarkerSize',4,'MarkerFaceColor', 'r' );
xlabel 'x'
ylabel 'F_X(x)'
title 'Fonction de repartition emperique de v.a.,'
disp(toc);% 'LineWidth',1,
end

function[P,x]=fonction_Emp_densite(X,a,delta)
N_x=length(X);
for i =1:N_x+1
    x(i)=a+delta*(i-1);
    cont=0;
    for n=1:length(X)
        if X(n)<=x(i)+delta && X(n)>x(i)
            cont=cont+1;
        end
    end
    P(i)=cont/(length(X));
end
end
function[]=densite_Emp_graphe(a,delta,X)
[P,x]=fonction_Emp_densite(X,a,delta);
figure;
plot(x,P,'ro','MarkerSize',2,'MarkerFaceColor', 'r' );
xlabel 'x'
ylabel 'f_X(x)'
title 'Fonctions de densité '
end