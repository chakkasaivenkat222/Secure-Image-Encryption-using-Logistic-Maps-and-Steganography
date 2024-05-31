function reconstructedImage = reconstructImageFromBlocks(blocks, Q, numBlocksRows, numBlocksCols, blockSize)
    % Initialize an array to store the reconstructed image
    reconstructedImage = zeros(numBlocksRows * blockSize, numBlocksCols * blockSize, 3, 'uint8');
    
    % Iterate through each block
    blockIndex = 1;
    for i = 1:numBlocksRows
        for j = 1:numBlocksCols
            % Retrieve current block
            currentBlock = blocks(:, :, :, blockIndex);
            
            % Apply quantization (multiplication by Q)
            for channel = 1:3
                currentBlock(:, :, channel) = currentBlock(:, :, channel) .* Q;
            end
            
            % Apply inverse DCT
            reconstructedBlock = zeros(size(currentBlock));
            for channel = 1:3
                reconstructedBlock(:, :, channel) = idct2(currentBlock(:, :, channel));
            end
            
            % Store the reconstructed block in the image
            reconstructedImage((i-1)*blockSize+1:i*blockSize, (j-1)*blockSize+1:j*blockSize, :) = uint8(reconstructedBlock);
            
            % Move to the next block
            blockIndex = blockIndex + 1;
        end
    end
end
