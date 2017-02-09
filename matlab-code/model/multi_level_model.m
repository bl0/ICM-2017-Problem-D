n_X2 = n_B - n_X1;
[Lq, Ls, Ws, Wq, D] = test_status(1, lambda_arrival / n_A, 1 / t_ID);

%% param part B
if lambda_arrival / (n_A / t_ID) > 1
    lambda_B = n_A / t_ID;
else
    lambda_B = lambda_arrival;
end

% class 1
lambda_B1 = lambda_B * ratio_1;
t_B1 = t_M1 + normcdf(t_X1, t_M1, sigma_t_M1);
[Lq_B1, Ls_B1, Ws_B1, Wq_B1, D_B1] = test_status(n_X1, lambda_B1, 1 / t_B1);

% class 2
lambda_B2 = lambda_B * (1 - ratio_1);
t_B2 = t_M2 + normcdf(t_X2, t_M2, sigma_t_M2);
[Lq_B2, Ls_B2, Ws_B2, Wq_B2, D_B2] = test_status(n_X2, lambda_B2, 1 / t_B2);

% B
Lq_B = Lq_B1 + Lq_B2;
Ls_B = Ls_B1 + Ls_B2;
Ws_B = ratio_1 * Ws_B1 + (1 - ratio_1) * Ws_B2;
Wq_B = ratio_1 * Wq_B1 + (1 - ratio_1) * Wq_B2;
D_B = D_B1 + D_B2;
 
% all
Lq_all = Lq_B + n_A * Lq;
Ls_all = Ls_B + n_A * Ls;
Ws_all = Ws_B + Ws;
Wq_all = Wq_B + Wq;
D_all = D + D_B;