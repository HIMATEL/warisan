clear all;
n = -10:20;
u = [zeros(1,10) 1 zeros(1,20)];
stem(n,u);
xlabel('Waktu n');ylabel('Amplitudo');
title('Sederetan sinyal sample beramplitudo 1');
axis([-10 20 0 1.2]);
