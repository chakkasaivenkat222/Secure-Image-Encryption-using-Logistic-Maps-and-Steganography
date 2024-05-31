function inverse_image = IDCT_alone(blocks, imageSize)

    [rows, cols, ~] = size(imageSize);
    blockSize = size(blocks, 1);

    numBlocksRows = floor(rows / blockSize);
    numBlocksCols = floor(cols / blockSize);

    % Initialize an array to store the reconstructed image
    reconstructedImage = zeros(rows, cols, 3, 'uint8');

    % Reconstructing the image from blocks
    blockIndex = 1;
    for i = 1:numBlocksRows
        for j = 1:numBlocksCols
            % Extracting the current block
            dct_block = blocks(:, :, :, blockIndex);
            currentBlock = zeros(size(dct_block));
            for channel = 1:3
                currentBlock(:,:,channel) = idct2(dct_block(:,:,channel));
            end
            % Placing the block in the reconstructed image
            reconstructedImage((i-1)*blockSize+1:i*blockSize, (j-1)*blockSize+1:j*blockSize, :) = currentBlock;
            blockIndex = blockIndex + 1;
        end
    end

    % Trimming the image if necessary (if the input size is not exactly divisible by the block size)
    if any(size(reconstructedImage) ~= imageSize)
        reconstructedImage = reconstructedImage(1:rows, 1:cols, :);
    end

    % Display the reconstructed image
    figure;
    imshow(reconstructedImage);
    impixelinfo();

    inverse_image = reconstructedImage;
end
