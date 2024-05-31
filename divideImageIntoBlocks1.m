function blocks = divideImageIntoBlocks1(imagePath)
    
    originalImage = imread(imagePath);
    
    [rows, cols, ~] = size(originalImage);

    blockSize = 8;

    numBlocksRows = floor(rows / blockSize);
    numBlocksCols = floor(cols / blockSize);

    % Initialize an array to store the blocks
    blocks = zeros(blockSize, blockSize, 3, numBlocksRows * numBlocksCols, 'uint8');

    % Extracting and store each block
    blockIndex = 1;
    for i = 1:numBlocksRows
        for j = 1:numBlocksCols
            % Extracting the current block
            currentBlock = originalImage((i-1)*blockSize+1:i*blockSize, (j-1)*blockSize+1:j*blockSize, :);
            dct_block = dct2(currentBlock);
            blocks(:, :, :, blockIndex) = dct_block;
            blockIndex = blockIndex + 1;
        end
    end

    figure;
    for k = 1:numBlocksRows * numBlocksCols
        subplot(numBlocksRows, numBlocksCols, k);
        imshow(blocks(:, :, :, k));
    end
end