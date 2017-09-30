function [output] = sigmLog(input)
    output = 1./(1 + exp(-input));
end
