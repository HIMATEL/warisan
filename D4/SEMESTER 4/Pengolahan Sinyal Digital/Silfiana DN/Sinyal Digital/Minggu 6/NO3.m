R = 100;
f = 0.02;
m = 0:R-1;
s = sin(2*pi*f*m); % sinyal aslinya
d = 0.5*(rand(1,R) - 0.5);
x = s + d;

h1=[0.1 0.2 0.3 0.4];
h2=[0.4 0.3 0.2 0.1 ];
h3=[0.2 0.2 0.2 0.2 0.2];
y1= conv(x,h1);
y2= conv(x,h2);
y3= conv(x,h3);

hold on
plot(x,'r');
plot(y1,'b');
plot(y2,'m');
plot(y3,'g');


