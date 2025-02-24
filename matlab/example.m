b = [0.00027012, 0.00081037, 0.00081037, 0.00027012];
a = [ 1.        , -2.28382154,  1.77001169, -0.46444682];

y = filter(b, a, randn(100,1));
t = linspace(0, 1, length(y));

order = 2000;

[yi,dsi] = causalCubicInterp(y,order);
ti = linspace(0, 1, length(yi));
ds = dsi/order;

plot(y(1:end-ds), '.');
hold on;
plot((1:length(yi)-dsi).'/order, yi(1+dsi:end));
