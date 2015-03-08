function Y = layer_output(X, W, b, sample_flag)
    if nargin < 3
        b = 0;
    end
    if nargin < 4
        sample_flag = false;
    end
    
    nsam = floor(4096*0.8);
    nkeep = 1000;
    Y = reclin(W'*X + b);
    if(sample_flag)
        Y = sampling(Y, size(Y,1), nsam);
        %Y = keep_largest_abs(Y, nkeep);
    end
end