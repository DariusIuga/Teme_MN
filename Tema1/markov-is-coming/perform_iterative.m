function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
    x = x0;
    err = inf;
    steps = 0;

% Loop until the error is less than the tolerance or
% the maximum number of iterations is reached
    while err > tol && steps < max_steps
        x_new = G*x + c;
    
        err = norm(x_new - x);
        x = x_new;
    
        ++steps;
    end

	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed   
endfunction
