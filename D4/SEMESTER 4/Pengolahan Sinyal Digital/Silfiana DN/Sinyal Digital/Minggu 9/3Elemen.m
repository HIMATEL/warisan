clear all;
clc;
t = 0:500;
x = 1*cos(2*pi*0.004*t);
d = [0.7, zeros(1,4), -0.7, zeros(1,4)];
ns = [d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d d];
xn = x + ns(1:length(x));
elemen = 7;
ext=(elemen/2) - 1.5*mod(elemen, 2);
x1 = [zeros(1, ext) xn zeros(1,ext)];
b =(elemen/2) + 1.5*mod(elemen,2);
for i=b:500
  data=[];
  for j=1:elemen
    data=[data, x1(i+ext-j+1)];
  endfor
  sorted_data = sort(data);
  n = length(sorted_data);
  if mod(n,2) == 1 %odd
    median_value = sorted_data((n+1)/2);
  else
    median_value = (sorted_data(n/2) + sorted_data(n/2+1))/2;
  endif
  y(i)=median_value;
  fprintf('Median_Value is: %f\n', median_value);
endfor
INIT=0;
subplot(3,1,1);
plot(x);
title('Sinyal Murni - Farid');
axis([0 500]);
subplot(3,1,2);
plot(xn);
title('Sinyal Derau');
axis([0 500]);
subplot(3,1,3);
plot(y);
title('Sinyal setelah filter median 7 elemen');
axis([0 500]);
