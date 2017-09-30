% PPGET - Programa de Pos-Graducao Eng. Telecom
% Name: Thiago Silva Agostinho
% Course: ICA

%% initial commands
clc; clear;

%% create AND dataset - x0,x1,x2,label
%dataset1 = [repmat([0 0],50,1) + (0.1*randn(50,2)), zeros(50,1)];
%dataset2 = [repmat([0 1],50,1) + (0.1*randn(50,2)), zeros(50,1)];
%dataset3 = [repmat([1 0],50,1) + (0.1*randn(50,2)), zeros(50,1)];
%dataset4 = [repmat([1 1],50,1) + (0.1*randn(50,2)), ones(50,1)];
%data = [dataset1; dataset2; dataset3; dataset4];
data = dlmread('and.dataset.txt'); 
[m, n] = size(data);


%% plot 
dataset_plot = figure; hold on;
scatter(data(1:50,1),data(1:50,2),'*','blue');
scatter(data(51:100,1),data(51:100,2),'*','blue');
scatter(data(101:150,1),data(101:150,2),'*','blue');
scatter(data(151:200,1),data(151:200,2),'*','red');
saveFigure(dataset_plot,'dataset_plot');
saveas(dataset_plot,'dataset_plot','jpeg');


%% number of realizations
realizations = 30; 

%% realization loop
for i=1:realizations
    data = data(randperm(m),:); % shuffle data
    [iris_dataset_train, iris_dataset_test] = prepare_dataset(data,0.8);
    
    % train
    [weight] = ps_train(iris_dataset_train,0.1,-1,100); 

    % test net
    [accuracy(i), conf_mat(:,:,i)] = ps_test(iris_dataset_test,-1,weight);
end

%% results
accuracy_mean = mean(accuracy);
conf_mat_mean = mean(conf_mat,3);
accuracy_std = std(accuracy);

%% plotting decision surface

% reate a grid of points spanning the entire space within some bounds of 
% the actual data values
x1range = min(data(:,1)):.005:max(data(:,1));
x2range = min(data(:,2)):.005:max(data(:,2));
[xx1, xx2] = meshgrid(x1range,x2range);
XGrid = [xx1(:) xx2(:)];

predicted = ps_predict(XGrid,weight);

figure;
gscatter(xx1(:),xx2(:),predicted,'br');
