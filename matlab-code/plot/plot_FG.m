raw1 = [
2.5
5.6
7.3
9.3
20.1
22.4
24.5
41.2
67.1
68.8
77.9
];
raw2 = [
0
1.5
3.5
11 
];
len1 = length(raw1)-1;
A1 = zeros(len1, 1);
for i = 1:len1
    A1(i) = raw1(i+1) - raw1(i);
end
len2 = length(raw2)-1;
A2 = zeros(len2, 1);
for i = 1:len2
    A2(i) = raw2(i+1) - raw2(i);
end

A = [A1; A2];


fig = figure;
hold on; 
histogram(A);
xlabel('Seconds of X-Ray scan time', 'FontSize',16);
ylabel('frequency', 'FontSize',16);

if exist('fig_home','var') == 0
    fig_home = './';
end
saveas(fig, [fig_home, mfilename, '.png']);

