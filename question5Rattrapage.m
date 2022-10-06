function[] = question5()

    T= 2;
    N=100;
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
            X(i+1)=X(i)-X(i)/(T-t(i))*delta_t+sigma*(W(i+1)-W(i));
            I2=I2+(W(i+1)-W(i))/(T-t(i));

        end
%         plot(X);
%         hold on;
         X2(k+1)=(x0*(T-k)/T)+sigma*(T-k)*I2;

    end
    plot(X);
    figure;
    plot(X2);
    %plot(X2,'ro','MarkerSize',4,'MarkerFaceColor', 'r');




end