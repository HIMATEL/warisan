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

y = x + d;

h1 = flip(h);
z = conv(h1,y);

figure;
subplot(2,1,1);
plot(x,'r');
title("sinyal (x[n])");
axis([1 40]);

subplot(2,1,2);
plot(z,'b');
title("sinyal z(n)");
axis([1 40]);
