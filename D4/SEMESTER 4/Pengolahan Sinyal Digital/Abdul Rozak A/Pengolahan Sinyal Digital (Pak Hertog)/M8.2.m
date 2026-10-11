clear all;

n=0:500;
f=0.006; %frekuensi sinyal
s=1.5*cos(2*pi*f*n); %sinyal sinusoidal
h=[0.7 zeros(1,4) -0.7 zeros(1,4)]; %derau/noise
z=[0]; %sinyal 0
k=[h h h h h h h h h h h h h h h h h h h h h h h h h];%deretan derau
u=[k k z]; %deretan derau yang lebih panjang
axis([0 510 -2.5 2.5]); %batas plot sinyal
m=100; %elemen filter
x=s+u; %membuat sinyal x, yaitu gabungan sininyal sinusoidal dan derau

subplot(3,1,1);
plot(x,'r'); %plot sinyal x[n]
title('Sinyal Gabungan x[n]');
xlabel('Waktu (s)');
ylabel('Amplituda');

axis([0 510 -2.5 2.5]);
x=[x zeros(1,m)];

%MEMBUAT FILTER AVERAGE
for i=1:500; %loop untuk memfilter setiap elemen sinyal
  w(i)=0;%inisialisasi agar 0

  for j=0:m-1; %loop untuk menambahkan sinyal sesuai elemen yang dipilih
      w(i)=w(i)+ x(i+j);
  end

  w(i)=w(i)/m; %membagi sinyal yang sudah ditambahakan agar mennjadi rata rata
end

subplot(3,1,2);
plot(w,'b'); %plot sinyal w[n], sinyal hasil filter average
title("Sinyal Hasil Filter Average 100 elemen")
xlabel('Waktu (s)');
ylabel('Amplituda');
axis([0 510 -2.5 2.5]);

%MEMBUAT FILTER MEDIAN
for i=1:502; %loop untuk membuat median setiap m elemen dari awal
  x1=[x(i:i+m-1)];
  y(i)=median(x1); %mencari median
end

subplot(3,1,3);
plot(y,'m'); %plot sinyal y{n], sinyal hasil filter median
title('Sinyal Hasil Filter Median 100 elemen');
xlabel('Waktu (s)');
ylabel('Amplituda');
axis([0 510 -2.5 2.5]);
