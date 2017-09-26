function [normalized_data] = normalize(data)
    num_samples = size(data,1);
    mean_of_data = mean(data);
    deviation = std(data);
    
    normalized_data = (data - repmat(mean_of_data,num_samples,1))./repmat(deviation, num_samples,1); 
end

