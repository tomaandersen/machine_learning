
clc;
clear;

L = [[0 0]; [1 1]; [2 0]];

W = BatchGradientDecent(L, 0.01)

x = linspace(0, 2, 100);
y = polyval(W, x);

plot(x, y, '-g');
hold on;
plot(L(:, 1), L(:,2), '+r');


