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

a = 0.8;
d = a*(rand(1, 40));

figure;
subplot(3,1,1);
plot(hn,'g');
title("sinyal ditransmisikan (h[n])");
axis([1 40]);

subplot(3,1,2);
plot(x,'r');
title("sinyal yang diterima (x[n])");
axis([1 40]);

subplot(3,1,3);
plot(d,'b');
title("sinyal derau (d[n])");
axis([1 40]);
