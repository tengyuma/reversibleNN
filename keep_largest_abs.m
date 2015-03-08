function Y=keep_largest_abs(X, k)
% keep the absolute-value-largest k entries in vec 

	Y = zeros(size(X));
    for i = 1:size(Y,2)
        Y(:,i)=keep_largest_abs_vec(X(:,i), k);
    end
end

function vec_keep=keep_largest_abs_vec(vec, k)
% keep the absolute-value-largest k entries in vec 
    vec_keep = vec;

	[~,sid] = sort(abs(vec),'descend');
	ind = ~ismember(1:length(vec), sid(1:k));
	vec_keep(ind) = 0;
end