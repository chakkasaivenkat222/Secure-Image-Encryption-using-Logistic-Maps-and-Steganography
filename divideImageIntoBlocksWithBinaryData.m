function blocks = divideImageIntoBlocksWithBinaryData(imagePath, binaryStream)
    
    originalImage = imread(imagePath);
    
    [rows, cols, ~] = size(originalImage);

    blockSize = 8;

    numBlocksRows = floor(rows / blockSize);
    numBlocksCols = floor(cols / blockSize);

    % Initialize an array to store the blocks
    blocks = zeros(blockSize, blockSize, 3, numBlocksRows * numBlocksCols, 'uint8');

    % Extracting and store each block
    blockIndex = 1;
    streamIndex = 1;
    for i = 1:numBlocksRows
        for j = 1:numBlocksCols
            % Extracting the current block
            currentBlock = originalImage((i-1)*blockSize+1:i*blockSize, (j-1)*blockSize+1:j*blockSize, :);
            % Modify pixel values according to binary stream
            for channel = 1:3
                for k = 1:numel(currentBlock(:,:,channel))/3
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
                    % Apply modification to the pixel value
                    currentBlock(k, :, channel) = bitor(bitand(currentBlock(k, :, channel), bitcmp(3, 'uint8')), value);
                    % Move to the next 3 bits in the stream
                    streamIndex = streamIndex + 3;
                end
            end
            blocks(:, :, :, blockIndex) = currentBlock;
            blockIndex = blockIndex + 1;
        end
    end

    % Combine blocks into a single image
    combinedBlocksImage = [];
    for i = 1:numBlocksRows
        rowBlocks = blocks(:,:,:, (i-1) * numBlocksCols + 1 : i * numBlocksCols);
        rowImage = reshape(rowBlocks, blockSize, numBlocksCols * blockSize, 3);
        combinedBlocksImage = [combinedBlocksImage; rowImage];
    end
    % Display the combined image
    
    figure;
    imshow(uint8(combinedBlocksImage));
end
