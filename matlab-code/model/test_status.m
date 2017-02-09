function [Lq, Ls, Ws, Wq, Var] = test_status(s, lambda, mu)

rho = lambda / mu;
rho_s = rho / s;

if rho_s >= 1
   Lq =  inf;
   Ls = inf;
   Ws = inf;
   Wq = inf;
   Var = inf;
   return;
end

%% p0
tmp = 0;
for n = 0:s-1
    tmp = tmp + rho^n / factorial(n);
end
tmp = tmp + rho^s / (factorial(s) * (1 - rho_s));
p0 = 1 / tmp;

%% L
c = rho^s * p0 / (factorial(s) * (1 - rho_s));
Lq = c * rho_s / (1 - rho_s);
Ls = Lq + rho;
Ws = Ls / lambda;
Wq = Lq / lambda;
% assert(Wq - (Ws - 1 / mu) < 1e-9)

%% Var
Var = (mu - Ws)^2 * exp(rho) * p0;
syms n
f = rho^n * p0 * ((n-s+1)*mu - Ws)^2 / (factorial(n));
for i = s+1:10e9
    d = double(subs(f, i));
    Var = Var+d;
    if(d < 1e-39)
        break;
    end
end

end