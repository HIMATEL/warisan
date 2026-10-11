#####NO 1#####
n = 0:0.001:0.099; %membuat panjang sample sinyal x 100
x = sin(2*pi*30*n) + sin(2*pi*50*n); %sinyal x

%membuat windows baru untuk plot sinyal
figure;
%plot sinyal x
subplot(2,1,1);
plot(n,x);
title('sinyal x(sinyal asli)');
ylabel('Tegangan');
xlabel('waktu');
axis([0 0.1 -3 3]);
%f_s, frekuensi sampling = 0.001
%f_1 = 30 Hz
%f_2 = 50 Hz

####NO 2####
d = 0.8*rand(size(n)); %sinyal derau atau noise
y = x+d; %sinyal y, yang merupkana penjumlahan sinyal x dan d

%plot sinyal y
subplot(2,1,2);
plot(n,y);
title('sinyal y (x yang terkena noise)');
ylabel('Tegangan');
xlabel('waktu');

####NO 3####
X = fft(x,512); %melakukan transformasi fourier untuk mengubah
                %sinyal x ke domain frekuensi
Pxx = X.*conj(X)/512; %membuat sinyal spektrum daya
f = 1000*(1:512)/512; %frekuensi sinyal untuk diplot
                      %1000 digunakan untuk mwngubah indeks frekuensi
                      %menjadi Hz

%membuat windows baru untk plot sinyal
figure;
%plot sinyal Pxx
subplot(2,2,1);
plot(f,Pxx(1:512));
title('sinyal x dalam domain frekuensi')
ylabel('Daya')
xlabel('frekuensi')

%plot sinyal X
subplot(2,2,3);
plot(f,X(1:512));
ylabel('Tegangan');
xlabel('frekuensi');

####NO 4####
Y = fft(y,512); %melakukan transformasi fourier untuk mengubah
                %sinyal x ke domain frekuensi
Pyy = Y.*conj(X)/512; %membuat sinyal sprektrum daya

%plot sinyal Pyy
subplot(2,2,2);
plot(f,Pyy(1:512));
title('sinyal y dalam domain frekuensi')
ylabel('Daya')
xlabel('frekuensi')

%plot sinyal Y
subplot(2,2,4);
plot(f,Y(1:512));
ylabel('Tegangan');
xlabel('frekuensi');

####NO 5####
Xn1 = Xn2 = Y; %inisialiasi sinyal baru

%membuat filter berdasarkan amplitudo
treshold = 30; %set treshold atau batas amplitudo untuk filter
Xn1(abs(Xn) < treshold) = 0; %Xn1 sebagai sinyal hasil filter berdasarkan
                             %amplitudo yaitu dengan cara menghapus sinyal
                             %yang memiliki amplitudo diatas 30 pada domain
                             %frekuensi

%membuat filter berdasarkan frekuensi
for i = 50:462 %set batas frekuensi yang akan dijadikan band-stop filter
               %50 Hz untuk batas bawah, 462 Hz untuk batas atas
  Xn2(i) = 0;%Xn2 sebagai sinyal hasil filter
             %sinyal yang berada pada batas frekuensi di hapus
end

%membuat windows baru untuk plot sinyal
figure;
%plot sinyal Xn1
subplot(2,2,1);
plot(f,Xn1(1:512));
title('Sinyal y setelah difilter berdasarkan amplitudo');
ylabel('amplitudo');
xlabel('frekuensi');

%plot sinyal Xn2
subplot(2,2,2);
plot(f,Xn2(1:512));
title('sinyal y setelah difilter berdasarkan frekuensi');
ylabel('amplitudo');
xlabel('frekuensi');

####NO 6####
%melakukan inverse fourier transform
%untuk mengubah kembali sinyal ke domain waktu
Xi1 = ifft(Xn1);
Xi2 = ifft(Xn2);

%plot sinyal Xi1
subplot(2,2,3);
plot(n,Xi1(1:length(n)));
ylabel('amplitudo')
xlabel('waktu')

%plot sinyal Xi2
subplot(2,2,4);
plot(n,Xi2(1:length(n)));
ylabel('amplitudo');
xlabel('waktu');
