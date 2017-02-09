clear; close all; clc;
lambda_arrival = 5 * 1 / 3.504;
n_A = 17;
n_B = 20;
t_ID = 11.3588;
t_X1 = 2.0500;
t_X2 = 14;
t_MMW = 10.5081;
sigma_t_MMW = 3.0413;
ratio_1 = 0.6154;

run_single_line_model;
run_multi_line_model;
run_multi_level_model;