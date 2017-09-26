function [dataset] = prepare_dataset(dataset,training_percentage)
    % last index of train dataset
    last_index = floor(training_percentage*size(dataset,1));
    
    data_train = dataset(1:last_index,:);
    data_test = dataset(last_index+1:end,:);
    
    % create a struct to prepared dataset
    dataset = struct('data_train',[],'label_train',[],'data_test',[],'label_test',[]);
    
    dataset.data_train = data_train(:,1:end-1);
    dataset.label_train = data_train(:,end);
    
    dataset.data_test = data_test(:,1:end-1);
    dataset.label_test = data_test(:,end);
end

