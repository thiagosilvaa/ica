clc; clear;

% read database file to matrix
data = dlmread('iris.data.txt');

% organize dataset to work - 80% train, 20% test
[m, n] = size(data);
data = data(randperm(m),:); % shuffle data
[iris_dataset_train, iris_dataset_test] = prepare_dataset(data,0.8);

% train
[weight,me,mse] = ps_train(iris_dataset_train,0.05,-1,100); 

% test net
accuracy = ps_test(iris_dataset_test,-1,weight);
