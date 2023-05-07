function [FeatureMatrix, ResponseVector] = prepare_for_regression(filename)
    % Read in the CSV file
    filedata = fileread(filename);

    % Split the file data into lines
    lines = strsplit(filedata, '\n');

    % Split the first line into feature names
    featurenames = strsplit(lines{1}, ',');

    % Initialize the feature and response matrices
    FeatureMatrix = zeros(length(lines)-1, length(featurenames)-1);
    ResponseVector = zeros(length(lines)-1, 1);

    % Loop over the lines of the file (skipping the first line)
    for i = 2:length(lines)
        % Split the line into values
        values = strsplit(lines{i}, ',');

        % Loop over the values
        for j = 1:length(values)-1
            % Convert the value to a number if it is not already numeric
            if ~isnumeric(values{j})
                FeatureMatrix(i-1,j) = str2double(values{j});
            else
                FeatureMatrix(i-1,j) = values{j};
            end
        end

        % Convert the response value to a number
        ResponseVector(i-1) = str2double(values{end});
    end
end
