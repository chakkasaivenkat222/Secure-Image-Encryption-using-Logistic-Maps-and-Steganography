function lsbs = collecting_3lsb(imagePath)
    % Read the image
    inputImage = imread(imagePath);
    
    % Convert the image to grayscale if it's not already
    if size(inputImage, 3) == 3
        inputImage = rgb2gray(inputImage);
    end
    
    % Get image dimensions
    [rows, cols] = size(inputImage);
    
    % Initialize an array to store the LSBs
    lsbs = zeros(rows, cols, 'uint8');
    
    % Extract the last 3 LSBs from each pixel
    for i = 1:rows
        for j = 1:cols
            pixel = inputImage(i, j);
            lsbs(i, j) = bitand(pixel, 7); % Extract last 3 LSBs (bitwise AND with 7)
        end
    end
    
    % Reshape the array to a 1D array
    lsbs = reshape(lsbs, [1, numel(lsbs)]);
end


