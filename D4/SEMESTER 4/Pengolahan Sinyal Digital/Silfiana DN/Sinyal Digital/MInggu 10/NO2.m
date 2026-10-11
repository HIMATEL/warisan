clc;                               %membersihkan layar

%sinyal informasi
n = 0:0.001:0.6;                   %inisialisasi variabel n
x = sin(2*pi*30*n)+sin(2*pi*50*n); %persamaan sinyal informasi (x)

%sinyal derau
for i=1:600                        %batas indeks
  d(i) = randn();                  %persamaan sinyal derau
  while (d(i)<-0.8 || d(i)>0.8)    %fungsi while
    d(i) = randn();
  endwhile                         %mengakhiri fungsi while
     y(i) = d(i)+x(i);             %persamaan sinyak derau + informasi
endfor                             %mengakhiri fungsi for

subplot(3,1,1);
plot(x, 'r');                      %plot sinyal informasi (x)
axis ([0 600 -2 2]);               %merupakan batas sumbu
title("Sinyal Informasi");         %menampilkan judul

subplot(3,1,2);
plot(d, 'm');
axis ([0 600 -2 2]);                %merupakan batas sumbu
title("Sinyal Derau");              %menampilkan judul

subplot(3,1,3);
plot(y, 'g');
axis ([0 600 -2 2]);                %merupakan batas sumbu
title("Sinyal Informasi dan Derau");%menampilkan judul

