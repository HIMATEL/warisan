clc;
clear all;

h = [3 1 0.5];
lh = length(h);
axis = zeros(1,40);
hn = [h,axis];

a = 0.8;
d = a*(rand(1,40));

for i = 1:lh;
  axis(1,25+i) = h(i);
 endfor
 x = 0.5*axis;

figure;
subplot(3,1,1);
plot(hn, 'm');
title ("Sinyal yang Ditransmisikan (h[n])");
axis([1 40]);

subplot(3,1,2);
plot(x, 'r');
title("Sinyal yang Diterima (x[n])");
axis([1 40]);

subplot(3,1,3);
plot(d, 'g');
title("Sinyal Derau (d[n])");
axis ([1 40]);

