function [w, me, mse] = ps_train(dataset, epochs)
    coeff = 0.05; %learning-rate
    bias = -1;
    dataset = dataset(dataset(:,1:end-1),bias*ones(size(dataset,1),1),dataset(:,end));
    input_vector = []; %data vector
    [m, n] = size(dataset,1)
    num_attributes = n-1;
    weight_vector = rand(1,num_attributes); %weight vector 
    
    error = [];
    
    for e = 1:epochs
       data = dataset(randperm(m),:);
       input_vector = data(:, 1:end-1); 
       desired_output = data(:,end);
       
       for i = 1:m
            actual_output = sign(weight_vector*input_vector(i,:)');
            error(i) = desired_output(i) - actual_output;
            
            if error(i) ~= 0
               weight_vector = weight_vector + coeff*error(i)*input_vector(i,:); 
            end 
       end
       
       me(e, :) = mean(error);
       mse(e, :) = mean(error.^2); 
    end
    
end

