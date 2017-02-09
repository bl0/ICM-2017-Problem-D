clear; close all; clc;

lambda_arrival = 5 * 1 / 3.504;
n_A = 17;
n_B = 20;
t_ID = 11.3588;
t_X1 = 2.0500;
t_X2 = 14;
t_MMW = 10.5081;
sigma_t_MMW = 3.0413;
% ratio_1 = 0.6154;

%% change alpha
len = 100;
d = 1 / len;
ratios = d:d:1;

Lq_all_single_line_alpha = zeros(len, 1);
Ls_all_single_line_alpha = zeros(len, 1);
Ws_all_single_line_alpha = zeros(len, 1);
Wq_all_single_line_alpha = zeros(len, 1);
Var_all_single_line_alpha = zeros(len, 1);

Lq_all_multi_line_alpha = zeros(len, 1);
Ls_all_multi_line_alpha = zeros(len, 1);
Ws_all_multi_line_alpha = zeros(len, 1);
Wq_all_multi_line_alpha = zeros(len, 1);
Var_all_multi_line_alpha = zeros(len, 1);

for i = 1:len
    fprintf('%d\r', i);

    ratio_1 = ratios(i);
    run_single_line_model;
    Lq_all_single_line_alpha(i) = Lq_all;
    Ls_all_single_line_alpha(i) = Ls_all;
    Ws_all_single_line_alpha(i) = Ws_all;
    Wq_all_single_line_alpha(i) = Wq_all;
    Var_all_single_line_alpha(i) = Var_all;

    run_multi_line_model;
    Lq_all_multi_line_alpha(i) = Lq_all;
    Ls_all_multi_line_alpha(i) = Ls_all;
    Ws_all_multi_line_alpha(i) = Ws_all;
    Wq_all_multi_line_alpha(i) = Wq_all;
    Var_all_multi_line_alpha(i) = Var_all;
end

fig_Lq = figure(1);
hold on;
plot(ratios, Lq_all_single_line_alpha, 'r-', 'LineWidth',2);
plot(ratios, Lq_all_multi_line_alpha, 'b-', 'LineWidth',2);
xlabel('alpha', 'FontSize',16);
ylabel('Lq', 'FontSize',16);
legend({'single line', 'multi line'}, 'FontSize', 14);
saveas(fig_Lq, '../figure/Lq-alpha.jpg');

fig_WS = figure(2);
hold on;
plot(ratios, Ws_all_single_line_alpha, 'r-', 'LineWidth',2);
plot(ratios, Ws_all_multi_line_alpha, 'b-', 'LineWidth',2);
xlabel('alpha', 'FontSize',16);
ylabel('Ws', 'FontSize',16);
legend({'single line', 'multi line'}, 'FontSize', 14);
saveas(fig_WS, '../figure/Ws-alpha.jpg');

fig_Var = figure(3);
hold on;
plot(ratios, Var_all_single_line_alpha, 'r-', 'LineWidth',2);
plot(ratios, Var_all_multi_line_alpha, 'b-', 'LineWidth',2);
xlabel('alpha', 'FontSize',16);
ylabel('Var', 'FontSize',16);
legend({'single line', 'multi line'}, 'FontSize', 14);
saveas(fig_Var, '../figure/Var-alpha.jpg');

%% change mu
ratio_1 = 0.6154;
t_X1_0 = 2.0500;
t_X2_0 = 14;
t_MMW_0 = 10.5081;

len = 100;
min_ = 0.5;
max_ = 1.1;
d =  (max_ - min_) / len;
scales = min_+d:d:max_;

Lq_all_single_line_mu = zeros(len, 1);
Ls_all_single_line_mu = zeros(len, 1);
Ws_all_single_line_mu = zeros(len, 1);
Wq_all_single_line_mu = zeros(len, 1);
Var_all_single_line_mu = zeros(len, 1);

Lq_all_multi_line_mu = zeros(len, 1);
Ls_all_multi_line_mu = zeros(len, 1);
Ws_all_multi_line_mu = zeros(len, 1);
Wq_all_multi_line_mu = zeros(len, 1);
Var_all_multi_line_mu = zeros(len, 1);

for i = 1:len
    if (mod(i, floor(len / 100)) == 0)
        fprintf('%d\r', i);
    end

    scale = scales(i);
    t_X1 = t_X1_0 * scale;
    t_X2 = t_X2_0 * scale;
    t_MMW = t_MMW_0 * scale;

    run_single_line_model;
    Lq_all_single_line_mu(i) = Lq_all;
    Ls_all_single_line_mu(i) = Ls_all;
    Ws_all_single_line_mu(i) = Ws_all;
    Wq_all_single_line_mu(i) = Wq_all;
    Var_all_single_line_mu(i) = Var_all;

    run_multi_line_model;
    Lq_all_multi_line_mu(i) = Lq_all;
    Ls_all_multi_line_mu(i) = Ls_all;
    Ws_all_multi_line_mu(i) = Ws_all;
    Wq_all_multi_line_mu(i) = Wq_all;
    Var_all_multi_line_mu(i) = Var_all;
end

fig_Lq_mu = figure;
hold on;
plot(scales, Lq_all_single_line_mu, 'r-', 'LineWidth',2);
plot(scales, Lq_all_multi_line_mu, 'b-', 'LineWidth',2);
xlabel('scale', 'FontSize',16);
ylabel('Lq', 'FontSize',16);
legend({'single line', 'multi line'}, 'FontSize', 14, 'Location', 'northwest');
saveas(fig_Lq_mu, '../figure/Lq-scale.jpg');

fig_WS_mu = figure;
hold on;
plot(scales, Ws_all_single_line_mu, 'r-', 'LineWidth',2);
plot(scales, Ws_all_multi_line_mu, 'b-', 'LineWidth',2);
xlabel('scale', 'FontSize',16);
ylabel('Ws', 'FontSize',16);
legend({'single line', 'multi line'}, 'FontSize', 14, 'Location', 'northwest');
saveas(fig_WS_mu, '../figure/Ws-scale.jpg');

fig_Var_mu = figure;
hold on;
plot(scales, Var_all_single_line_mu, 'r-', 'LineWidth',2);
plot(scales, Var_all_multi_line_mu, 'b-', 'LineWidth',2);
xlabel('scale', 'FontSize',16);
ylabel('Var', 'FontSize',16);
% ylabel('Var', 'FontSize', 14, 'FontSize',16);
legend({'single line', 'multi line'}, 'FontSize', 14, 'Location', 'northwest');
saveas(fig_Var_mu, '../figure/Var-scale.jpg');
