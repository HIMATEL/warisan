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

y = d+x;

hl = flip(h);
z  = conv(hl,y);

figure;
subplot(3,1,1);
plot(x);
title("Sinyal yang Diterima (x[n])");
axis([1 40]);

subplot(3,1,2);
plot(z,'g');
title("Sinyal Konvolusi h[-n] pada y[n] (z[n])");
axis([1 40]);

subplot(3,1,3);
plot(x,'b',z,'g');
title("Sinyal x[n] dan z[n]");
axis([1 40]);
