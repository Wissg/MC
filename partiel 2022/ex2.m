disp("Exo 2: Partiel 2021/2022");
question2();
function [] = question2() 
 T = 2; 
 W(1) = 0; 
 N = 100; 
 delta_t = T / N; 
 Nmc = 1000; 
 I1 = 0; 
 I2 = 0; 
 t = (0:N) * delta_t; 
 %t=linspace(0,T,N+1); 
 
 for i = 1:N 
     W(i + 1) = W(i) + sqrt(delta_t) * randn;  
     I1 = I1 + t(i) * (W(i + 1) - W(i));  
     I2 = I2 + W(i) * delta_t; 
 end 
 I2 = T * W(N + 1) - I2; 
 disp("membre de gauche " + I1); %affiche l'integrale de gauche
 disp("Membre de droite " + I2); %affiche l'egalite de droite
 disp("Difference " + abs(I1 - I2)); % verifie si elles sont egale (soustraction proche de zeros) 
  
end 