clear all;
R = 100;
f = 0.02;
m = 0:R-1;
s = sin(2*pi*f*m); % sinyal aslinya
d = 0.5*(rand(1,R) - 0.5);
x = s + d;
h1 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]; %deret 1
h2 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2];%deret 2
y = conv(x,h1);
z = conv(x,h2);
plot(x);
hold on;
plot(y);
hold on;
plot(z);
