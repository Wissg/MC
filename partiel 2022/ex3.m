disp("Exo 3: Partiel 2021/2022");
question3_Cas1();
%question3_Cas2();
function [] = question3_Cas1() 
 T = 2; 
 s0 = 10; 
 r = 0.4; 
 sigma0 = 0.5; 
 Nmc = 100; 
 N = 100; 
 delta_t = T / N; 
 W(1) = 0; 
 S(1) = s0; 
 R(1) = 0; 
 t = (0:N) * delta_t; 
 for k = 1:Nmc 
     for i = 1:N 
         W(i + 1) = W(i) + sqrt(delta_t) * randn;  
         S(i + 1) = S(i) + S(i)*(r * delta_t + sigma0*(W(i + 1) - W(i))); 
         R(i)=(S(i+1)-S(i))/S(i); 
     end 
% plot(t,S); 
% hold on; 
plot (R); % on plot 100 trajectoire de rendement  
%hold on; 
 DailyReturn(k) = R(N); 
 end 
densite_Emp_graphe(-0.3,0.01,DailyReturn); % on affiche la fonction de densité 
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
plot(x,P,'ro','MarkerSize',2,'MarkerFaceColor', 'r' ); xlabel 'x' 
ylabel 'f_X(x)' 
title 'Fonctions de densité ' 
end 

function [k] = sigma(t,r,T,S,sigma0) 
 k=sigma0*exp(5*r*t/T)*(sin(S/10)^2);  
end 

function [] = question3_Cas2() 
 T = 2; 
 s0 = 10; 
 r = 0.4; 
 sigma0 = 0.5; 
 Nmc = 100; 
 N = 100; 
 delta_t = T / N; 
 W(1) = 0; 
 S(1) = s0; 
 t = (0:N) * delta_t; 
 R(1)=0; 
  
 for k = 1:Nmc 
     for i = 1:N 
         W(i + 1) = W(i) + sqrt(delta_t) * randn;  
         S(i + 1) = S(i)*(1 + r * delta_t +  sigma(t(i),r,T,S(i),sigma0) * (W(i + 1) - W(i)));  
         R(i+1) = (S(i+1) - S(i)) / S(i);  
     end 
         plot(R);
         hold on;
         %plot(t,S); 
         %RR=rmmissing(R); 
         % RRR=R(N+1); 
         DailyReturn(k) = R(N);
 end 
 densite_Emp_graphe(-0.3,0.015,DailyReturn);   
end
