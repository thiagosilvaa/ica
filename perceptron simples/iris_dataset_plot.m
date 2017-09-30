dataset_setose_others = dlmread('iris.data.setose_others.txt');
figure(1);
gscatter(dataset_setose_others(:,1),dataset_setose_others(:,2),dataset_setose_others(:,end),'rb','so');
title('Iris-setose and Others');
xlabel('Sepal length');ylabel('Sepal width');
    
dataset_versicolor_others = dlmread('iris.data.versicolor_others.txt');
figure(2);
gscatter(dataset_versicolor_others(:,1),dataset_versicolor_others(:,2),dataset_versicolor_others(:,end),'rb','so');
title('Iris-versicolor and Others');
xlabel('Sepal length');ylabel('Sepal width');

dataset_virginica_others = dlmread('iris.data.virginica_others.txt');
figure(3);
gscatter(dataset_virginica_others(:,1),dataset_virginica_others(:,2),dataset_virginica_others(:,end),'rb','so');
title('Iris-versicolor and Others');
xlabel('Sepal length');ylabel('Sepal width');            