function [G, c] = get_Jacobi_parameters (Link)
	[m, n]=size(Link)
	G=sparse(m-2,n-2);
	c=sparse(m-2,1);

	for i=1:m-2
		% p_win=Link(i,n-1)
		% p_lose=Link(i,n)
		if Link(i,n-1)>Link(i,n)
			c(i)= Link(i,n-1)-Link(i,n)
			% Daca p_lose<p_win, probabilitatea de castig rezultata e 0
		end
	end
	G=Link(1:m-2,1:n-2)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
	
  % TODO: get_Jacobi_parameters

endfunction
