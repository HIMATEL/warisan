clear all;
R = 100;
f = 0.02;
m = 0:R-1;
s = sin(2*pi*f*m); % sinyal aslinya
d = 0.5*(rand(1,R) - 0.5);
x = s + d;
h2 = [0 0 0 0 0 -1 0 0 0 0 0];
y = conv(x,h2);
plot(x);
hold on;
plot(y);
