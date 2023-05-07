function [Y, InitialMatrix] = parse_csv_file(file_path)

	% Citesc din fisier
	in = fopen(file_path, 'r');
	file_contents = textscan(in, '%s', 'Delimiter', '\n');
	fclose(in);

	% Citesc datele
	data = file_contents{1}(2:end);
	m = length(data);
	n = length(strsplit(data{1}, ','));
	InitialMatrix = cell(m, n-1);
	Y = zeros(m, 1);
	for i = 1:m
    	row_data = strsplit(data{i}, ',');
    	Y(i) = str2double(row_data{1});
    	for j = 2:n
        	InitialMatrix{i,j-1} = row_data{j};
    	end
	end
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
endfunction