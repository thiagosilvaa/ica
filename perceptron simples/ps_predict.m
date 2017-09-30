function [predicted] = ps_predict(dataset,weight_vector)
    dataset = [-1*ones(size(dataset,1),1),dataset(:,1:end)];
    [m, n] = size(dataset);
    input_vector = dataset;
    
    for i = 1:m
        predicted(i) = step(weight_vector*input_vector(i,:)');
    end
end
