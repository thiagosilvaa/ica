function [acc] = ps_test(dataset,bias,weight_vector)
    dataset = [bias*ones(size(dataset,1),1),dataset(:,1:end-1),dataset(:,end)]
    [m, n] = size(dataset);
    input_vector = dataset(:,1:end-1);
    desired_output = dataset(:,end);
    error = [];
    
    for i = 1:m
        actual_output(i) = step(weight_vector*input_vector(i,:)');
    end
    
    acc = mean(actual_output' == desired_output);
end

