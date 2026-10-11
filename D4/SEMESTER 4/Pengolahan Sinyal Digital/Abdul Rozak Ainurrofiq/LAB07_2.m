clc;
clear all;

h = [3 1 0.5];
lh =  length(h);
axis = zeros(1,40);
hn = [h,axis];

a = 0.8;
d = a*(rand(1, 40));

for i = 1:lh
  axis(1,25+i) = h(i);
end
x = 0.5*axis;
y = d+x;

figure;
subplot(3,1,1);
plot(x,'g');
title("sinyal ditransmisikan (h[n])");
axis([1 40]);

subplot(3,1,2);
plot(d,'r');
title("sinyal yang diterima (x[n])");
axis([1 40]);

subplot(3,1,3);
plot(y,'b');
title("sinyal derau (d[n])");
axis([1 40]);
