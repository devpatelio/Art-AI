

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

%% LOAD ANY IMAGE HERE BY REPLACING THE NAME
A = double(imread('slackprofile.JPG'));

A = A / 255; 

img_size = size(A);

X = reshape(A, img_size(1) * img_size(2), 3);

K = 8;  %% CHANGE THIS VALUE FOR DIFFERENT CLUSTERS AND COLORS
max_iters = 10; %%CHANGE THIS VALUE FOR ACCURACY IN TERMS OF CONVERGENCE

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

fprintf('Program paused. Press enter to continue.\n');
pause;


fprintf('\nApplying K-Means to compress an image.\n\n');

idx = findClosestCentroids(X, centroids);

X_recovered = centroids(idx,:);
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

subplot(1, 2, 1);
imagesc(A); 
title('Original');

subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));


fprintf('Program paused. Press enter to continue.\n');
pause;
