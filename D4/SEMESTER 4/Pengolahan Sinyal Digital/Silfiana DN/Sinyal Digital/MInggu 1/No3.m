n1 = 0:50; #vektor n1 dari nilai 0 sampai nilai 50
n2 = 2:51; #vektor n2 dari nilai 2 sampai nilai 51
f1 = 1/25;
f2 = 1/25;

y1 = 2*sin(2*pi*f1*n1);
y2 = 2*cos(2*pi*f2*(n2-2));

plot(n1, y1, 'r', 'DisplayName', '2*sin(2*pi*f1*n1)');
hold on;
plot(n2, y2, 'b', 'DisplayName', '2*cos(2*pi*f2*(n2-2)');

