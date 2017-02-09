% fprintf('single-line model\n-------------------\n');
[Lq, Ls, Ws, Wq, Var] = test_status(n_A, lambda_arrival, 1 / t_ID);
% fprintf('Lq_A=%f\nLs_A=%f\nWs_A=%f\nWq_A=%f\nD_A=%f\n\n', Lq, Ls, Ws, Wq, Var);

%% param part B
if lambda_arrival / (n_A / t_ID) > 1
    lambda_B = n_A / t_ID;
else
    lambda_B = lambda_arrival;
end

%mu B
tB = ratio_1 * (t_MMW + normcdf(t_X1, t_MMW, sigma_t_MMW) * (t_X1 - t_MMW)) + ...
    (1 - ratio_1) * (t_MMW + normcdf(t_X2, t_MMW, sigma_t_MMW) * (t_X2 - t_MMW));

[Lq_B, Ls_B, Ws_B, Wq_B, Var_B] = test_status(n_B, lambda_B, 1 / tB);
% fprintf('Lq_B=%f\nLs_B=%f\nWs_B=%f\nWq_B=%f\nD_B=%f\n\n', Lq_B, Ls_B, Ws_B, Wq_B, Var_B);

% all
Lq_all = Lq_B + Lq;
Ls_all = Ls_B + Ls;
Ws_all = Ws_B + Ws;
Wq_all = Wq_B + Wq;
Var_all = Var_B + Var;
% fprintf('Lq_all=%f\nLs_all=%f\nWs_all=%f\nWq_all=%f\nD_all=%f\n\n', Lq_all, Ls_all, Ws_all, Wq_all, D_all);
