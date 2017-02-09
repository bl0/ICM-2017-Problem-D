% fprintf('multi-line model\n-------------------\n');

% Zone A
[Lq, Ls, Ws, Wq, Var] = test_status(1, lambda_arrival / n_A, 1 / t_ID);
% fprintf('Lq_A=%f\nLs_A=%f\nWs_A=%f\nWq_A=%f\nVar=%f\n\n', Lq, Ls, Ws, Wq, D);

%% param Zone B
if lambda_arrival / (n_A / t_ID) > 1
    lambda_B = n_A / t_ID;
else
    lambda_B = lambda_arrival;
end

%mu B
tB = ratio_1 * (t_MMW + normcdf(t_X1, t_MMW, sigma_t_MMW) * (t_X1 - t_MMW)) + ...
    (1 - ratio_1) * (t_MMW + normcdf(t_X2, t_MMW, sigma_t_MMW) * (t_X2 - t_MMW));

[Lq_B, Ls_B, Ws_B, Wq_B, Var_B] = test_status(1, lambda_B / n_B, 1 / tB);
% fprintf('Lq_B=%f\nLs_B=%f\nWs_B=%f\nWq_B=%f\nD_B=%f\n\n', Lq_B, Ls_B, Ws_B, Wq_B, D_B);

% all
Lq_all = n_B * Lq_B + n_A * Lq;
Ls_all = n_B * Ls_B + n_A * Ls;
Ws_all = Ws_B + Ws;
Wq_all = Wq_B + Wq;
Var_all = Var + Var_B;
% fprintf('Lq_all=%f\nLs_all=%f\nWs_all=%f\nWq_all=%f\nVar=%f\n\n', Lq_all, Ls_all, Ws_all, Wq_all, D_all);
