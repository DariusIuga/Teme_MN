function [Link] = get_link_matrix (Labyrinth)
	Adj=get_adjacency_matrix(Labyrinth)
	[m, n]=size(Adj)
	Link=sparse(m,n)
	
	for i=1:m
		Link(i,:)=Adj(i,:)/nnz(Adj(i,:))
	end
endfunction
