raw1 = [
7.5
5.3
11.1
10
9.1
8.8
12.6
15.4
11.9
];
raw2 = [
14.6
11.8
14.8
20.4
7.7
7.5
10.9  
];
% len1 = length(raw1)-1;
% A1 = zeros(len1, 1);
% for i = 1:len1
%     A1(i) = raw1(i+1) - raw1(i);
% end
% len2 = length(raw2)-1;
% A2 = zeros(len2, 1);
% for i = 1:len2
%     A2(i) = raw2(i+1) - raw2(i);
% end

A = [raw1; raw2];


fig = figure;
hold on; 
histogram(A, 7);
xlabel('Seconds of ID Check Process time', 'FontSize',16);
ylabel('frequency', 'FontSize',16);

if exist('fig_home','var') == 0
    fig_home = './';
end
saveas(fig, [fig_home, mfilename, '.png']);

