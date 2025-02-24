b = [0.00050151, 0.00200605, 0.00300907, 0.00200605, 0.00050151];
a = [1.        , -3.00075505,  3.43132361, -1.76890453,  0.34636017];

y = filter(b, a, randn(100,1));
t = linspace(0, 1, length(y));

order = 2000;

[yi,dsi] = causalCubicInterp(y,order);
ti = linspace(0, 1, length(yi));
ds = dsi/order;

plot(y(1:end-ds), '.');
hold on;
plot((1:length(yi)-dsi).'/order, yi(1+dsi:end));
