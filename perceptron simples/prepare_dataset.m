function [data_train, data_test] = prepare_dataset(dataset,training_percentage)
    % last index of train dataset
    last_index = floor(training_percentage*size(dataset,1));
    
    %standardize
    %dataset_normalized = normalize(dataset(:,1:end-1));
    %dataset_normalized = [dataset_normalized, dataset(:,end)];
    dataset_normalized = dataset;
    
    data_train = dataset_normalized(1:last_index,:);
    data_test = dataset_normalized(last_index+1:end,:);
end

