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

%Konversi sinyal informasi ke domain frekuensi
X = fft(x,512);                    %inisialisasi komponen fourier sinyal (x)
Pxx = X.* conj(X)/512;             %power spectrum sinyal (x)
f = 1000*(1:512)/512;              %persamaan frekuensi sinyal (x)

%KOnversu sinyal informasi-derau ke domain frekuensi
Y = fft(y,512);                    %inisalisasi komponen fourier sinyal (y)
Pyy = Y.* conj(Y)/512;             %power spectrum sinyal (y)
fy = 1000*(1:512)/512;             %inisalisasi frekuensi sinyal (y)

subplot(2,1,1);
plot(f,Pxx(1:512), 'r')
title("Sinyal informasi dalam domain frekuensi"); %menampilkan judul

subplot(2,1,2);
plot(fy,Pyy(1:512), 'm')
title("Sinyal informasi-derau dalam domain frekuensi"); %menampilkan judul

