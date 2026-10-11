clc;
clear all;

A_sin = 1;
t_sin = 0:200;
f_sin = 0.01;
x = A_sin * sin(2 * pi * f_sin * t_sin);

% Sinyal Derau
B = [0.5, zeros(1, 9), -0.5, zeros(1, 9)];
D = [B B B B B B B B B B 0]; % Membentuk noise berperiodik

% Sinyal Gabungan x[n]
xn = x + D;

% Sinyal x[n]
elm = 5;
ext = (elm - mod(elm, 2));
x1 = [xn, zeros(1, ext)];

% Program untuk filter
for i = 1:200
    x2 = [x1(i:i + elm - 1)];
    y(i) = median(x2);
end

% Plot Sinyal Sinusoidal
subplot(3, 1, 1);
plot(x, 'b');
axis([0 200]);
title('Sinyal Sinusoidal');
xlabel('Time (t)');
ylabel('Voltage (V)');

% Plot Sinyal Derau
subplot(3, 1, 2);
plot(D, 'r');
axis([0 200]);
title('Sinyal Derau');
xlabel('Time (t)');
ylabel('Voltage (V)');

% Plot Sinyal Gabungan
subplot(3, 1, 3);
plot(xn, 'magenta');
axis([0 200]);
title('Sinyal Gabungan');
xlabel('Time (t)');
ylabel('Voltage (V)');

