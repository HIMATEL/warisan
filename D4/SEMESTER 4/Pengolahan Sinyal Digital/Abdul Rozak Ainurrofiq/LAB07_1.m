clc;
clear all;

h = [3 1 0.5];
lh =  length(h);
axis = zeros(1,40);
hn = [h,axis];

for i = 1:1h;
  axis(1,25+i) = h(i);
endfor
x = 0.5*axis;

figure;
subplot(2,1,1);
plot(hn,'g');
title("sinyal ditransmisikan (h[n])");
axis([1 40]);

subplot(2,1,2);
plot(x,'r');
title("sinyal yang diterima (x[n])");
axis([1 40]);
