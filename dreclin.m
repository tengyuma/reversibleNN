function Y=dreclin(X)
    Y=zeros(size(X));
    Y(X>0) = 1;
end