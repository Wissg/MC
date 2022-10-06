disp("Exo 1: Partiel 2021/2022");
question1();
function [] = question1() 
 T = 2; 
 lambda = 2; 
 W(1) = 0; 
 N = 100; 
 delta_t = T / N; 
 Nmc = 1000; 
 proba = 0; 
 cpt = 0; 
 t=(0:N)*delta_t; 
 for k = 1:Nmc % simulation de Nmc trajectoire
     for i = 1:N 
     W(i + 1) = W(i) + sqrt(delta_t) * randn; 
     end 
 plot(t,W); % affiche une trajectoire du mouvement browninen
% xlabel 't' 
% ylabel 'Processus W_t' 
% title 'Trajectoires du Mouvement Brownien'  hold on; 
 last_value(k) = W(N + 1); 
 if (abs(last_value(k)) < 0.5)  
    cpt = cpt + 1; 
 end 
 a(k) = exp(lambda * last_value(k) - (lambda^2) * T  / 2); 
 end 
 proba = cpt / Nmc; % calcule proba demander
 disp("proba[ |Wt| < 0.5 ] = " + proba); 
 disp("esperance = " + mean(a)); % affichage proba demander
end 