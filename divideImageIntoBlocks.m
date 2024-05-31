function blocks = divideImageIntoBlocks(imagePath)
    
    originalImage = imread(imagePath);
    
    [rows, cols, ~] = size(originalImage);

    blockSize = 8;

    numBlocksRows = floor(rows / blockSize);
    numBlocksCols = floor(cols / blockSize);

    % Initialize an array to store the blocks
    blocks = zeros(blockSize, blockSize, 3, numBlocksRows * numBlocksCols, 'uint8');

    % Define quantization matrix (example matrix)
    Q = [16 11 10 16 24 40 51 61;
         12 12 14 19 26 58 60 55;
         14 13 16 24 40 57 69 56;
         14 17 22 29 51 87 80 62;
         18 22 37 56 68 109 103 77;
         24 35 55 64 81 104 113 92;
         49 64 78 87 103 121 120 101;
         72 92 95 98 112 100 103 99];

    % Extracting and store each block
    blockIndex = 1;
    for i = 1:numBlocksRows
        for j = 1:numBlocksCols
            % Extracting the current block
            currentBlock = originalImage((i-1)*blockSize+1:i*blockSize, (j-1)*blockSize+1:j*blockSize, :);
            dct_block = zeros(size(currentBlock));
            for channel = 1:3
                dct_block(:,:,channel) = dct2(currentBlock(:,:,channel));
                % Apply quantization
                dct_block(:,:,channel) = round(dct_block(:,:,channel) ./ Q);
            end
            blocks(:, :, :, blockIndex) = dct_block;
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
    %figure;
    %for k = 1:numBlocksRows * numBlocksCols
    %   subplot(numBlocksRows, numBlocksCols, k);
    % imshow(blocks(:, :, :, k));
    %end
    %Display the combined image
    figure;
    imshow(combinedBlocksImage);
end
