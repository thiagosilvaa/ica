% PPGET - Programa de Pos-Graducao Eng. Telecom
% Name: Thiago Silva Agostinho
% Course: ICA

%% initial commands
clc; clear;

%% create AND dataset - x0,x1,x2,label
dataset1 = [repmat([0 0],50,1) + (0.1*randn(50,2)), zeros(50,1)];
dataset2 = [repmat([0 1],50,1) + (0.1*randn(50,2)), zeros(50,1)];
dataset3 = [repmat([1 0],50,1) + (0.1*randn(50,2)), zeros(50,1)];
dataset4 = [repmat([1 1],50,1) + (0.1*randn(50,2)), ones(50,1)];
data = [dataset1; dataset2; dataset3; dataset4];
[m, n] = size(data);

%% plot 
dataset_plot = figure; hold on;
scatter(dataset1(:,1),dataset1(:,2),'*','blue');
scatter(dataset2(:,1),dataset2(:,2),'*','blue');
scatter(dataset3(:,1),dataset3(:,2),'*','blue');
scatter(dataset4(:,1),dataset4(:,2),'*','red');
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
