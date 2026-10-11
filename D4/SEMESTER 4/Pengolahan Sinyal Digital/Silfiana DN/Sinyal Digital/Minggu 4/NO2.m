clear all;
n = 0:35; a = 0.9; K = 20;
x = K*a.^n;
stem(n,x);
xlabel('Waktu n');ylabel('Amplitudo');

