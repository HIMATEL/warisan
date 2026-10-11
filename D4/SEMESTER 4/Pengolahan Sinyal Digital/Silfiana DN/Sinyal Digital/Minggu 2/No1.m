n = 0:50;
f = 1/20;
amp = 2;
swt = 2*pi*f*n;
y1 = amp*sawtooth(swt);
stem(n,y1,"bk");

xlabel('Waktu');
ylabel('Amplitudo');
grid;


