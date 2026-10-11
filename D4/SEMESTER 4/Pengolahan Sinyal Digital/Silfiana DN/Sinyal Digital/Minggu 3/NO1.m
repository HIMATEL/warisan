close all;
close all;
A = 10000;
B = 500;
amp = 2;
sec = 2;
dur = nsec*A;
n = 0:dur;
y = amp*sin(2*pi*n*B/A);
figure()
plot(y(1:250));

