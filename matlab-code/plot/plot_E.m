raw = [
8.8
20.1
32.5
36
43.5
51.7
64.6
75.6
84.7
92.4
103.1
118.2
129.2
146.2
159.6
167.3
174
185.6
205
213.6
251.1
262.4
274.8
286.8
300
311.1
318.4
326.5
340.8
347.9
358.9
368.5
396
404.6
414.3
425.3
435
443.6
455.6
462.6
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
xlabel('Seconds of Milimeter Wave Scan time', 'FontSize',16);
ylabel('frequency', 'FontSize',16);

if exist('fig_home','var') == 0
    fig_home = './';
end
saveas(fig, [fig_home, mfilename, '.png']);

