clear all
close all

% load data W X Y 
load('../data/fc7.mat');
load('../data/alex_net.mat');
W = (layers(7).weights{1})';
ndata=90;
X = fc7(:,1:ndata);
Y = layer_output(X, W);

tilX = layer_output(Y, W');
supp_X = (X>0);
supp_tilX = (tilX > 0);
inters = (supp_X & supp_tilX);
fprintf('iter 0: %d %d %d \n',floor(mean(sum(supp_X,1))), floor(mean(sum(supp_tilX,1))), floor(mean(sum(inters,1))) );

% gradient descent
step = 0.01;
max_step=5;
for t=1:max_step
    % compute gradient
    rtilX = zeros(size(tilX));
    rtilX(tilX>0) = 1;
    T = (X-tilX) .* rtilX;
    G = -2 * T * Y';
    
    % update W 
    W = W - step * G;
    
    % update prediction
    tilX = layer_output(Y, W');
       
    supp_tilX = (tilX > 0);
    inters = (supp_X & supp_tilX);
    fprintf('iter %d: %d %d %d \n', t,  floor(mean(sum(supp_X,1))), floor(mean(sum(supp_tilX,1))), floor(mean(sum(inters,1))));
end