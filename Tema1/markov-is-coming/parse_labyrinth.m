function [Labyrinth] = parse_labyrinth(file_path)
    in = fopen(file_path, 'rt'); % deschide fisierul pentru citire

    m= fscanf(in, "%d",1); % citeste dimensiunile matricii
   	n= fscanf(in, "%d",1);
	for i=1:m
		for j=1:n
			Labyrinth(i,j)=fscanf(in, "%d", 1); % citeste elementele matricii
		end;
	end;		
    fclose(in); % inchide fisierul

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

endfunction
