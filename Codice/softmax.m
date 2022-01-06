function s = softmax(x)
    %s = exp(x-max(x')') ./ sum(exp(x-max(x')'),2);
    m = max(x,[],2);
    s = exp(x-m) ./ sum(exp(x-m),2);
end

