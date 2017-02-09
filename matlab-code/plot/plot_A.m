raw = [
0
11.2
12.5
13.6
15
24.6
33.9
54.4
56
74.6
76.3
103.6
108.7
124.1
146.2
174.4
177.7
179
181.1
186
189
190.4
200.5
201.6
214.4
232.8
257.2
275.1
275.5
277.2
277.8
306.2
312.8
336.6
341.9
345.8
363.3
366.5
371.3
406.1
406.8
408.7
409.9
426.2
427
447.1
456.2
460.6
461.3
462
466.8
495.7
502.6
504.7
505.5
507.2
522.9
523.8
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
xlabel('Seconds between the arrival of two pre-check passengers', 'FontSize',16);
ylabel('frequency', 'FontSize',16);


if exist('fig_home','var') == 0
    fig_home = './';
end
saveas(fig, [fig_home, mfilename, '.png']);

