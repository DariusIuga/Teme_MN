function [path] = heuristic_greedy(start_position, probabilities, Adj)
    % start_position -> the starting point in the labyrinth
    % probabilities -> vector of associated probabilities: including WIN and LOSE
    % Adj -> adjacency matrix

    path = [start_position];
    visited = false(length(probabilities), 1);
    visited(start_position) = true;
    
    while ~isempty(path)
        position = path(end);
        if position == length(probabilities)-1
            return
        end

        unvisited_neighbors = find(Adj(position, :) & ~visited');
        if isempty(unvisited_neighbors)
            path = path(1:end-1);
        else
		
            [~, index] = max(probabilities(unvisited_neighbors));
            next_position = unvisited_neighbors(index);
            visited(next_position) = true;
            path = [path, next_position];
        end
    end

    path = [];
endfunction
