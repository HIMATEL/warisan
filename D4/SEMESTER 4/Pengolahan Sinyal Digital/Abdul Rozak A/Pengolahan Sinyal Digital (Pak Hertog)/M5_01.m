% Define the sequences
h = [2 3 1 4];
x = [1 2 3 4];

% Lengths of sequences
M = length(h);
N = length(x);

% Length of convolution output
L = M + N - 1;

% Perform convolution manually
for n = 1:L
    y(n) = 0;
    for k = 1:M
        if n-k+1 > 0 && n-k+1 <= N
            y(n) = y(n) + h(k) * x(n-k+1);
        end
    end
end

% Display the result
disp('Convolution result:');

stem(y);
