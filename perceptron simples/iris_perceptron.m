clc; clear;

% read database file to matrix
data = dlmread('iris.data.txt');

% organize dataset to work - 80% train, 20% test
[m, n] = size(data);

% num of repeats
n = 30; 

for i=1:n

    data = data(randperm(m),:); % shuffle data
    [iris_dataset_train, iris_dataset_test] = prepare_dataset(data,0.8);

    % train
    [weight,me,mse] = ps_train(iris_dataset_train,0.1,-1,100); 

    % test net
    [acc(i), conf_mat(:,:,i)] = ps_test(iris_dataset_test,-1,weight);
end

acc_mean = mean(acc);
conf_mat_mean = mean(conf_mat,3);
acc_std = std(acc);
