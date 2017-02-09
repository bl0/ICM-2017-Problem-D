mmw_time = [
    3.5000
    6.7000
    7.0000
    7.1000
    7.3000
    7.5000
    7.7000
    7.7000
    8.1000
    8.2000
    8.6000
    8.6000
    8.6000
    9.1000
    9.6000
    9.7000
    9.7000
   10.7000
   11.0000
   11.0000
   11.0000
   11.0000
   11.1000
   11.3000
   11.3000
   11.6000
   12.0000
   12.0000
   12.4000
   12.4000
   12.9000
   13.2000
   13.4000
   14.3000
   15.1000
   17.0000
   19.4000
   27.5000
   37.5000 
];

% t and sigma
len1 = floor(size(mmw_time, 1) * ratio_1);
ts_M1 = mmw_time(1:len1);
ts_M2 = mmw_time(len1+1:end);
t_M1 = mean(ts_M1);
t_M2 = mean(ts_M2);
sigma_t_M1 = std(ts_M1, 1);
sigma_t_M2 = std(ts_M2, 1);

fprintf('multi-level model\n-------------------\n');
fprintf('optimizing');
n_X1_opt = 0;
Lq_all_opt = inf;
Ls_all_opt = inf;
Ws_all_opt = inf;
Wq_all_opt = inf;
D_all_opt = inf;
Lq_B_opt = inf;
Ls_B_opt = inf;
Ws_B_opt = inf;
Wq_B_opt = inf;
D_B_opt = inf;

t1 = tic;
for n_X1 = 1:n_B-1
    multi_level_model;
    if(Ws_all < Ws_all_opt)
        n_X1_opt = n_X1;
        Ws_all_opt = Ws_all;
        Lq_all_opt = Lq_all;
        Ls_all_opt = Ls_all;
        Wq_all_opt = Wq_all;
        D_all_opt = D_all;
        Ws_B_opt = Ws_B;
        Lq_B_opt = Lq_B;
        Ls_B_opt = Ls_B;
        Wq_B_opt = Wq_B;
        D_B_opt = D_B;
    end
end 
fprintf('optimized\t\nn_X1 = %d\n\n', n_X1_opt);
n_X1 = n_X1_opt;
multi_level_model;
fprintf('Lq=%f\nLs=%f\nWs_A=%f\nWq_A=%f\nVar=%f\n\n', Lq, Ls, Ws, Wq, D);
fprintf('Lq_B1=%f\nLs_B1=%f\nWs_B1=%f\nWq_B1=%f\nVar=%f\n\n', Lq_B1, Ls_B1, Ws_B1, Wq_B1, D_B1);
fprintf('Lq_B2=%f\nLs_B2=%f\nWs_B2=%f\nWq_B2=%f\nVar=%f\n\n', Lq_B2, Ls_B2, Ws_B2, Wq_B2, D_B2);
fprintf('Lq_B=%f\nLs_B=%f\nWs_B=%f\nWq_B=%f\nVar=%f\n\n', Lq_B, Ls_B, Ws_B, Wq_B, D_B);
fprintf('Lq_all=%f\nLs_all=%f\nWs_all=%f\nWq_all=%f\nVar=%f\n\n', ...
    Lq_all_opt, Ls_all_opt, Ws_all_opt, Wq_all_opt, D_all_opt);

