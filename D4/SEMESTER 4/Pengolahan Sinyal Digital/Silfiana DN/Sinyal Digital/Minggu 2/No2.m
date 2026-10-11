n1 = 0:10;
f1 = 1/5;
amp1 = 2;
swt1 = 2*pi*f1*n1;
y1 = amp1 * sawtooth(swt1);

n2 = 10:20;
f2 = 1/5;
amp2 = 2;
swt2 = 2*pi*f2*n2;
y2 = -amp2 * sawtooth(swt2);

n3 = 20:30;
f3 = 1/5;
amp3 = 2;
swt3 = 2*pi*f3*n3;
y3 = amp3 * sawtooth(swt3);

n4 = 30:40;
f4 = 1/5;
amp4 = 2;
swt4 = 2*pi*f4*n4;
y4 = -amp4 * sawtooth(swt4);

n5 = 40:50;
f5 = 1/5;
amp5 = 2;
swt5 = 2*pi*f5*n5;
y5 = amp5 * sawtooth(swt5);

stem(n1, y1, 'bk');
hold on
stem(n2, y2, 'bk');
hold on
stem(n3, y3, 'bk');
hold on
stem(n4, y4, 'bk');
hold on
stem(n5, y5, 'bk');

xlabel('Waktu');
ylabel('Amplitudo');
grid;

