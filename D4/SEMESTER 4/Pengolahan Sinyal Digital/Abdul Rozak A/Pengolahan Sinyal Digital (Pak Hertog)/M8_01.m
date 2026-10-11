clear all;
n=0:400;  %panjang sinyal yang akan di-plot
f=0.005;  %frekuensi sinyal sinus
s=3*cos(2*pi*f*n);  %sinyal sinus
h=[0.6 zeros(1,9) -0.6 zeros(1,9)]; %sinyal derau atau noise
k=[h h h h h h h h h h];
u=[k k 0];
x=s+u;  %sinyal x[n] atau gabungan sinus dan noise

subplot(3,1,1);
plot(n,s);  %memplot sinyal s

subplot(3,1,2);
plot(n,u);  %memplot sinyal noise

subplot(3,1,3);
plot(n,x);  %memplot sinyal gabungan x
