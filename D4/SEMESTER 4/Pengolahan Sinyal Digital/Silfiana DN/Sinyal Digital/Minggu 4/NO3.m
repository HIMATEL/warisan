n = 0:50;
f = 0.08;
phase = 90;
A = 1.5;
arg = 2*pi*f*n - phase;
x = A*cos(arg);
clf;
stairs(n,x);
axis([0 40 -2 2]);
grid;
title('Deretan Sinusoidal');
xlabel('Waktu n');
ylabel('Amplitudo');
axis;

