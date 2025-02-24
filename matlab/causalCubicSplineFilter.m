function [wc] = causalCubicSplineFilter(M,y)
    alpha = sqrt(3)-2;
    wc = filter(1,[1 -alpha],filter(-1*(alpha.^(M+1:-1:1)),1,y));
end

