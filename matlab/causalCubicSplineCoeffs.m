function [d,c,b,a] = causalCubicSplineCoeffs(w,yd)
    Tcw = [[3 3 -3 -3];
           [-3 -6 3 6];
           [0 3 0 -3];
           [0 0 0 0]];
    Tcy = [[0 -2 2];
           [0 3 -3];
           [0 0 0];
           [0 0 1]];
    
    coeffs = zeros(4,length(yd));
    for i=1:4
        coeffs(i,1:end) = filter(Tcw(i,1:end),1,w)...
            +filter(Tcy(i,1:end),1,yd);
    end

    d = coeffs(1,1:end);
    c = coeffs(2,1:end);
    b = coeffs(3,1:end);
    a = coeffs(4,1:end);
end

