raw = [
0
9.1
9.7
11.3
12.8
14.3
15.9
26.8
56.8
81.1
136
143.6
147.1
162.7
164.2
185.6
192.8
195.3
206.8
209.3
266.5
282.4
287.8
299.6
309.5
340.1
356.7
360.4
379.9
458.8
470.8
480.8
481.7
484.2
485.6
497.6
499.8
500.9
501.6
512.8
525.6
534.1
535.8
553.2
574.4
592.9
595.5
];

len = length(raw)-1;
A = zeros(len, 1);
for i = 1:len
    A(i) = raw(i+1) - raw(i);
end

close all
fig = figure;
hold on; 
histogram(A, 10);

xlabel('Seconds between the arrival of two regular passengers', 'FontSize',16);
ylabel('frequency', 'FontSize',16);

if exist('fig_home','var') == 0
    fig_home = './';
end
saveas(fig, [fig_home, mfilename, '.png']);

