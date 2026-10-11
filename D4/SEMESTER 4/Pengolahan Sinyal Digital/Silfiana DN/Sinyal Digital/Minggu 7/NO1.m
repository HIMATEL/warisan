clc;
clear all;

h = [3 1 0.5];
lh = length(h);
axis = zeros(1,40);
hn = [h,axis];

for i = 1:lh;
  axis(1,25+i) = h(i);
 endfor
 x = 0.5*axis;

 figure;
 subplot(2,1,1);
 plot(hn, 'm');
 title ("Sinyal yang Ditransmisikan (h[n])");
 axis([1 40]);

 subplot(2,1,2);
 plot(x, 'r');
 title("Sinyal yang Diterima (x[n])");
 axis ([1 40]);

