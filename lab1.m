%% 1 pi Approximation
n=100000;
x=rand(1,n)*2-1;
y=rand(1,n)*2-1;
d = sqrt(x.^2+y.^2);
InCircle = sum(d < 1);
PiApprox = 4*InCircle/n
%% 2 Integral Approximation
area=0;
n=100000;
for i = 1:n
    y=rand;
    x=rand;
    if y < (1-x^3)^(1/3)
        area=area+1;
        % (x,y) finns under grafen

    end
    
end
area/n
%% 3 New pi Approximation
for i=1:10
    for q=10^(i-1):10^i-1
        p=round(q*pi);
        if abs(p/q - pi) < abs(355/113 - pi)
        disp([p,q])
        break
        end
    end
    if abs(p/q - pi) < abs(355/113 - pi)
    break
    end
end      
%% 4 e Approximation
p_pre=1;
q_pre=1;
for i=1:6
    for q=10^(i-1):10^i-1
        p=round(q*exp(1));
        if abs(p/q - exp(1)) < abs(p_pre/q_pre - exp(1))
            p_pre=p;
            q_pre=q;
        end
    end
    disp([p_pre,q_pre])
end       