function [decoded_path] = decode_path(path, lines, cols)
    dims = [lines, cols];
    
    % Allocate space for the decoded path
    decoded_path = zeros(length(path) - 1, 2);
    
    % Loop through the path and convert each state to a pair of indices
    for i = 1:length(path)-1
        [row, col] = ind2sub(dims, path(i));
        decoded_path(i, :) = [col,row];
    end
endfunction