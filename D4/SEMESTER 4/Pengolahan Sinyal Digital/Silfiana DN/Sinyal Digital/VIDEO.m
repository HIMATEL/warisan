close all;
clear all;
F_s = 1000;
F_w = 500;
amp = 2;
nsec = 2;
dur= nsec*F_s;
n = 0:dur;
y = amp*sin(2*pi*n*F_w/F_s);
figure()
plot(y(1:250));
