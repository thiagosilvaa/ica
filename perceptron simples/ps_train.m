function [weight_vector, me, mse] = ps_train(dataset, coeff, bias, epochs)
    dataset = [bias*ones(size(dataset,1),1),dataset(:,1:end-1),dataset(:,end)]
    input_vector = []; %data vector
    [m, n] = size(dataset)
    num_attributes = n-1;
    weight_vector = rand(1,num_attributes); %weight vector 
    %weight_vector = [0 0 0];
    
    error = [];
    
    for e = 1:epochs
       data = dataset(randperm(m),:);
       input_vector = data(:, 1:end-1); 
       desired_output = data(:,end);
       
       for i = 1:m
            actual_output = step(weight_vector*input_vector(i,:)');
            error(i) = desired_output(i) - actual_output;
            
            weight_vector = weight_vector + coeff*error(i)*input_vector(i,:); 
       end
       
       me(e, :) = mean(error);
       mse(e, :) = mean(error.^2); 
    end
    
end

