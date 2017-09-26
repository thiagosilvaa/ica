clc; clear;

% read database file to matrix
data = dlmread('iris.data.txt');

% organize dataset to work
dataset = prepare_dataset(data,0.8);
