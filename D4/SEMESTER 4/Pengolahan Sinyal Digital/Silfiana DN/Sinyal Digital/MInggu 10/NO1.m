clc;
clear all;

%sinyal informasi
n = 0:0.001:0.6;
x = sin(2*pi*30*n) + sin(2*pi*50*n)

%sinyal derau
for i = 1:600
  D(i) = randn();
  while (D(i)<-0.8 || D(i)>0.8)
    D(i) = randn();
  endwhile
    y(i) = D(i) + x(i);
endfor

%konversi sinyal informasi domain frekuensi
X = fft(x,512);
Pxx = X.* conj(X)/512;
f = 1000*(1:512)/512;

%konversi sinyal informasi-derau ke domain frekuensi
Y = fft(y,512);
Pyy = Y.* conj(Y)/512;
f = 1000*(1:512)/512;

%sinyal penghilang derau
thres = 8;
Xn = Pyy;
for i = 1:512
  if Pyy(i)>thres
    xn(i) = Pyy(i);
else
    xn(i)=1;
  endif
endfor

xi = ifft(xn)

subplot(3,1,1);
plot(x, 'r');
axis([0 600 -2 2]);
title('Sinyal Informasi');

subplot(3,1,2);
plot(y, 'b');
axis([0 600 -2 2]);
title('Sinyal Informasi - Derau');

subplot(3,1,3);
plot(real(xi), 'g');
axis([0 600 -2 2]);
title('Sinyal x dengan xn dalam domain waktu');
