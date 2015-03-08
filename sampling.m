function [Y] = sampling(X,n,k)
    Y= zeros(n,size(X,2));
    for i=1:size(X,2)
        Y(:,i)=sampling_vec(X(:,i), n, k);
    end
end



function [y] = sampling_vec(x,n,k)
    S = randperm(n);
    y = zeros(n,1);
    y(S(1:k)) = x(S(1:k));
end

