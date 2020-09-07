function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1);
idx = zeros(size(X,1), 1);
m = size(X, 1);
x = size(X(:, 1));

distance = zeros(x(:, 1), K);

for i=1:m
    for k=1:K
        distance(i, k) = sqrt((X(i, 1)-centroids(k, 1))^2+(X(i, 2)-centroids(k, 2))^2);
    end
end

for i=1:m
    x = (distance(i, :));
    [M, I] = min(x);
    idx(i) = I;
end

end
