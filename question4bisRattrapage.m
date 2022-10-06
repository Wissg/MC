function [] = question4bis()
Nmc=1000;
    T = 0.5;
    r = 0.12;
    sa0 = 100;
    sb0 = 75;
    na = 110;
    nb = 100;
    sigmaa = 0.2;
    sigmab = 0.18;
    Sa(1) = sa0;
    Sb(1) = sb0;
    W(1) = 0;
    N = 100;
    delta_t = T / N;
    delta_ta = T / na;
    delta_tb = T / nb;
    p0 = na * sa0 + nb * sb0;
    ta = (0:na) * delta_ta;
    tb=(0:nb) * delta_tb;
    P(1) = p0;
    %P = 0;
    cpt = 0;
    proba = 0;

    for k = 1:Nmc

        for i = 1:na
            W(i + 1) = W(i) + sqrt(delta_ta) * randn;
            Sa(i + 1) = Sa(i)*(1 + r * delta_ta + sigmaa * (W(i + 1) - W(i)));

        end

        for i = 1:nb
            W(i + 1) = W(i) + sqrt(delta_tb) * randn;
            Sb(i + 1) = Sb(i)*(1 + r * delta_tb + sigmab * (W(i + 1) - W(i)));

        end

        P(k) = na * Sa(na + 1) + nb * Sb(nb + 1);

        if ((P(k) / p0) < 0.9) 
            cpt = cpt + 1;
        end 
 

     %plot(ta, Sa);
     %hold on;
     %plot(tb, Sb);
     %hold on;
     plot(P);
     



    end

    proba = cpt / Nmc;
    disp("proba  " + proba);
    disp(" P " + mean(P));

end