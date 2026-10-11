clear all;
R = 100;
f = 0.02;
m = 0:R-1;
s = sin(2*pi*f*m); % sinyal aslinya
d = 0.5*(rand(1,R) - 0.5);
x = s + d;
h1 = [0.1 0.3 0.5 0.7 0.8 ];
h2 = [0.05 0.1 0.15 0.2 0.25 0.25];
y = conv(x,h1);
z = conv(x,h2);
plot(x);
hold on;
plot(y);
hold on;
plot(z);
