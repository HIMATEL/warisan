R = 100;
f = 0.02;
m = 0:R-1;
s = sin(2*pi*f*m); % sinyal aslinya
d = 0.5*(rand(1,R) - 0.5);
x = s + d;

h=[7 6 5 4 2 1 0];
y = conv(x,h);

figure
hold on
plot(x,'r');
plot(y,'b');

