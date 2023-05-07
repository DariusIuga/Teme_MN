function [Y, InitialMatrix] = parse_data_set_file(file_path)

	% Deschid fisierul
	in = fopen(file_path, 'r');
	file_contents = textscan(in, '%s', 'Delimiter', '\n');
	fclose(in);

	% Citesc dimensiunile
	dimensions = str2double(strsplit(file_contents{1}{1}));
	m = dimensions(1);
	n = dimensions(2);

	% Retin datele
	data = file_contents{1}(2:end);
	InitialMatrix = cell(m, n);
	Y = zeros(m, 1);
	for i = 1:m
    	row_data = strsplit(data{i});
    	Y(i) = str2double(row_data{1});
    	for j = 2:n+1
        	InitialMatrix{i,j-1} = row_data{j};
    	end
	end

  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
endfunction