clear all;
n=0:400;  %panjang sinyal yang akan di-plot
f=0.005;  %frekuensi sinyal sinus
s=3*cos(2*pi*f*n);  %sinyal sinus
h=[0.6 zeros(1,9) -0.6 zeros(1,9)]; %sinyal derau atau noise
k=[h h h h h h h h h h];
u=[k k 0];
axis([0 410 -4 4]);
m=50;  %panjang elemen filter

x=s+u;  %sinyal x[n] atau gabungan sinus dan noise
subplot(2,1,1); %AKTIFKAN KALAU MAU PLOT   SAD
plot(x);  %memplot sinyal x
title('sinyal gabungan x[n]');

axis([0 410 -4 4]); %mengatur batas gambar
x=[x zeros(1,m)];

%===filter moving average===
for i=1:400;
  y(i)=0;

  for j=0:m-1;  %mencari rata-rata setiap m elemen
      y(i)=y(i)+ x(i+j);
  end

  y(i)=y(i)/m;  %untuk setiap y(i) di filter
end

subplot(2,1,2); %AKTIFKAN KALAU MAU PLOT SAD
plot(y); %AKTIFKAN KALAU MAU PLOT SAD
axis([0 510 -4 4]);
title('Output dengan moving average 50 elemen')

for i=1:400
  R(i)=abs(s(i)-y(i));
end

SADmov=sum(R);
SADmov
