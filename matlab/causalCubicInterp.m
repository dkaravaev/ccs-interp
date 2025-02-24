function [yi,ds] = causalCubicInterp(y,order)
    M = 20;
    dt = 0:1/order:1-1/order;

    w = causalCubicSplineFilter(M,y);

    % delayed filter
    db = zeros(M+1,1);
    db(end) = 1;
    yd = filter(db,1,y);

    [d,c,b,a] = causalCubicSplineCoeffs(w,yd);
    yi = zeros(length(y)*order,1);
    for n=1:length(d)
        yi(1+(n-1)*order:n*order) = cubicPoly(dt,d(n),c(n),b(n),a(n));
    end
    ds=(M+1)*order;
end

