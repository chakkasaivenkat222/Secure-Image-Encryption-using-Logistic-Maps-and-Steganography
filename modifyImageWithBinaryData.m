function modifiedImage = modifyImageWithBinaryData(imagePath, binaryStream)

    % Read the original image
    originalImage = imread(imagePath);
    
    % Get the size of the image
    [rows, cols, ~] = size(originalImage);
    
    % Calculate the total number of pixels
    totalPixels = rows * cols;

    % Check if binary stream length is sufficient for all pixels
  
    % Initialize modified image
    modifiedImage = originalImage;

    % Loop through each pixel
    streamIndex = 1;
    for row = 1:rows
        for col = 1:cols
            % Check if we have reached the end of the binary stream
            if streamIndex > numel(binaryStream)
                break;
            end
            % Extract 3 bits from the stream
            if streamIndex + 2 <= numel(binaryStream)
                bits = binaryStream(streamIndex:streamIndex+2);
            else
                bits = binaryStream(streamIndex:end);
            end
            % Convert binary to decimal
            value = bin2dec(bits);
            % Apply modification to the pixel value for each color channel
            for channel = 1:3
                modifiedImage(row, col, channel) = ...
                    bitor(bitand(modifiedImage(row, col, channel), bitcmp(3, 'uint8')), value);
            end
            % Move to the next 3 bits in the stream
            streamIndex = streamIndex + 3;
        end
    end
    figure;
    imshow(modifiedImage);
end
