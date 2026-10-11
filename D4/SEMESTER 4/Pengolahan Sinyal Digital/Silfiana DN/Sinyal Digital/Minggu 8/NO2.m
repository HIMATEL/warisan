clear all;

%Sinyal Sinusoidal
a = 1;
t = 0:200;
fc = 0.01;
x = sin(2*pi*fc*t);

% Sinyal Derau
b = [0.5, zeros(1,9), -0.5, zeros(1,9)];
d = [b b b b b b b b b b 0];

%Sinyal Gabungan
xn = x + d;
figure;
subplot(2,1,2);
plot(t, xn,'r');
title('Sinyal Gabungan x[n]');
xlabel('Waktu (s)');
ylabel('Amplituda');

% Filter moving average
start = (elm/2) + 0.5*mod (elm, 2);
for i = start:200
  temp = 0;
  for j = 1:elm
    temp = temp + x1 (i + ext - j + 1);
end
  y1(i) = (1/elm)*temp;
end
SAD = 0;
 for j = 2:198
  SAD = SAD + abs(x(j) - y1(j));
end
SAD
subplot(2, 2, 2);                           % subplot ketiga untuk sinyal dengan filter moving average
plot(y1, 'm');                              % plot y1, warna merah (red)
axis([0 200]);                              % sumbu ditampilkan dari 0 sampai 200
title('Sinyal dgn Filter Moving Average');  % atur judul plot
xlabel('Waktu (s)');                        % atur label pada sumbu-x
ylabel('Amplituda (V)');

% Filter median
for i = 1:200                               % untuk batas sumbu x hanya sampai 200
    x2 = [x1(i:i + elm - 1)];               % inisialisasi variabel x2
    y2(i) = median(x2);                     % fungsi median
end
subplot(2, 3, 2);                           % subplot kedua untuk sinyal dengan filter median
plot(y2, 'r');                              % plot y2, warna biru (blue)
axis([0 200]);                              % sumbu ditampilkan dari 0 sampai 200
title('Sinyal dgn Filter Median');          % atur judul plot
xlabel('Waktu (s)');                        % atur label pada sumbu-x
ylabel('Amplituda (V)');
