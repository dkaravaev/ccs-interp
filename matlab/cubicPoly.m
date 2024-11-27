function [interp] = cubicPoly(dt,d,c,b,a)
    interp=d*(dt.^3)+c*(dt.^2)+b*dt+a;
end