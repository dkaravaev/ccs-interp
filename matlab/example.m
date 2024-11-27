y = filter(1, [1 -0.9999], randn(100,1));
t = linspace(0, 1, length(y));

order = 2000;

[yi,dsi] = causalCubicInterp(y,order);
ti = linspace(0, 1, length(yi));
ds = dsi/order;

plot(y(1:end-ds), '.');
hold on;
plot((1:length(yi)-dsi).'/order, yi(1+dsi:end));
