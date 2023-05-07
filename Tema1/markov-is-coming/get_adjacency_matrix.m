function [Adj] = get_adjacency_matrix (Labyrinth)
  [m, n]=size(Labyrinth) % m reprezinta nr de linii si n nr de coloane
  Adj=sparse(m*n+2,m*n+2)

	for i=1:m*n+2
    	if (i<=m*n)
			% Nu e win sau lose
			if(i==1)
				% Coltul din stanga sus
				x=Labyrinth(1,1)
				if(bitand(x,8)==0)
					Adj(i,m*n+1)=1;
				end
				if(bitand(x,4)==0)
    				Adj(i, n+1)=1;
  				endif
  				if(bitand(x,2)==0)
    				Adj(i, 2) = 1;
  				endif
  				if(bitand(x,1)==0)
    				Adj(i,m*n+2) =1;
  				endif

			elseif(i==n)
				% Coltul din dreapta sus
				x=Labyrinth(1,n);
  				if(bitand(x,8)==0)
    				Adj(i,m*n+1) = 1;
  				endif
  				if(bitand(x,4)==0)
    				Adj(i , 2*n)=1;
  				endif
  				if(bitand(x,2)==0)
    				Adj(i, m*n+2) = 1;
  				endif
  				if(bitand(x,1)==0)
    				Adj(i,n-1) = 1;
  				endif

			elseif(i==m*n-n+1)
				% Coltul din stanga jos
				x=Labyrinth(m,1);
  				if(bitand(x,8)==0)
    				Adj(i,n*(m-2)+1) = 1;
  				endif
  				if(bitand(x,4)==0)
    				Adj(i , m*n+1)=1;
  				endif
  				if(bitand(x,2)==0)
    				Adj(i,n*m-n+2) = 1;
  				endif
  				if(bitand(x,1)==0)
    				Adj(i ,m*n+2) =1;
  				endif

			elseif(i==m*n)
				% Coltul din dreapta jos
				x=Labyrinth(m,n);
				if(bitand(x,8)==0)
    				Adj(i,(m-1)*n) = 1;
  				endif
  				if(bitand(x,4)==0)
    				Adj(i, m*n+1)=1;
  				endif
  				if(bitand(x,2)==0)
    				Adj(i,m*n+2) = 1;
  				endif
  				if(bitand(x,1)==0)
    				Adj(i ,n*m-1) =1;
  				endif

			elseif(i>1&&i<n)
				% Linia de sus, fara colturi
				x=Labyrinth(1,mod(i,n))
    			if(bitand(x,8)==0)
      				Adj(i,n*m+1) = 1;
    			endif
    			if(bitand(x,4)==0)
      				Adj(i, n+i)=1;
    			endif
    			if(bitand(x,2)==0)
      				Adj(i,i+1) = 1;
    			endif
    			if(bitand(x,1)==0)
      				Adj(i ,i-1) = 1;
    			endif

			elseif(i>(m*n-n+1) &&i<m*n)
				% Linia de jos, fara colturi
				x=Labyrinth(m,mod(i,n));
				if(bitand(x,8)==0)
      				Adj(i,i-n) = 1; %de verif asta
    			endif
    			if(bitand(x,4)==0)
      				Adj(i, n*m+1)=1;
    			endif
    			if(bitand(x,2)==0)
      				Adj(i,i+1) = 1;
    			endif
    			if(bitand(x,1)==0)
      				Adj(i ,i-1) = 1;
    			endif

			elseif(mod(i,n)==0)
				% Coloana din dreapta, fara colturi
				x=Labyrinth(floor(i/n),n);
				if(bitand(x,8)==0)
      				Adj(i,i-n) = 1;
    			endif
    			if(bitand(x,4)==0)
      				Adj(i, i+n) = 1;
    			endif
    			if(bitand(x,2)==0)
      				Adj(i,n*m+2) = 1;
    			endif
    			if(bitand(x,1)==0)
      				Adj(i ,i-1) = 1;
    			endif

			elseif(mod(i,n)==1)
				% Coloana din stanga, fara colturi
				x=Labyrinth(1+floor(i/n),1);
				if(bitand(x,8)==0)
      				Adj(i,i-n) = 1;
    			endif
    			if(bitand(x,4)==0)
      				Adj(i, i+n) = 1;
    			endif
    			if(bitand(x,2)==0)
      				Adj(i,i+1) = 1;
    			endif
    			if(bitand(x,1)==0)
      				Adj(i ,n*m+2) = 1;
    			endif

			else
				% Interiorul matricei
				x=Labyrinth(1+floor(i/n),mod(i,n))
				if(bitand(x,8)==0)
        			Adj(i,i-n) = 1;
      			endif
      			if(bitand(x,4)==0)
        			Adj(i,i+n) = 1;
      			endif
      			if(bitand(x,2)==0)
        			Adj(i, i+1) = 1;
      			endif
      			if(bitand(x,1)==0)
					Adj(i, i-1) = 1;
      			endif
			end

		else
			Adj(i,i)=1
		end;
	end;


	% Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth

  % TODO: get_adjacency_matrix implementation

endfunction
