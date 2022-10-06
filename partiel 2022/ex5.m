disp("Exo 5: Partiel 2021/2022");
%question5();
question5_2();
function[] = question5() 
 T= 2; 
 N=1000; 
 r=0.1; 
 sigma=5; 
 delta_t=T/N; 
 x0=10; 
 X(1)=x0; 
 X2(1)=x0; 
 W(1)=0; 
 t=(0:N)*delta_t;
 Nmc=1000; 
 I2=0; 
 for k=1:Nmc 
     for i=1:N 
         W(i+1)=W(i)+sqrt(delta_t)*randn;  
         X(i+1)=X(i)-X(i)/(T - t(i))*delta_t+sigma*(W(i+1)-W(i)); % avec l'equation stoquastique
         I2=I2+(W(i+1)-W(i))/(T-t(i));  % avec la solution de l'equation 

     end 
 %plot(X); 
 % hold on; % affiche Nmc X
 X2(k+1)=x0*(T-t(N))/T+sigma*(T-t(N))*I2;   %  resultat avec la solution de l'equation 
  
 end 
% figure; 
 plot(X); % affiche le gaphe avec l'equation stoquastique 
 hold on;
 %plot(X2); % affiche le gaphe avec la solutionde l'equation
 %plot(X2,'ro','MarkerSize',4,'MarkerFaceColor', 'r'); 
  
end 

function[] = question5_2() 
 T= 2; 
 N=1000; 
 r=0.1; 
 sigma=5; 
 delta_t=T/N; 
 x0=10; 
 X(1)=x0; 
 X2(1)=x0; 
 W(1)=0; 
 t=(0:N)*delta_t; 
 Nmc=1000; 
 I(1)=0; 
 for k=1:Nmc
 for i=1:N 
 W(i+1)=W(i)+sqrt(delta_t)*randn; 
 I(i+1)=I(i)+(W(i+1)-W(i))/(N-i); 
  
 end 
 plot(I); 
 hold on; 
 X2(k+1)=x0*(N-k)/N+sigma*(N-k)*I(k); 
  
 end 
 plot(X2);  
end
  
  
