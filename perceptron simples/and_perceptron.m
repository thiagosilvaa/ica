clc; clear;

%create AND dataset: x0,x1,x2,label
dataset = [0 0 0; 0 1 0; 1 0 0; 1 1 1];

%initialize weight vector
weight = [0 0 0];

%learning rate
n = 0.5;

ps_train(dataset,0.5,1,100);