function reconstructedImage = reverseDCT(blocks, imagePath)
    % Read the original image to get its size
    originalImage = imread(imagePath);
    [rows, cols, ~] = size(originalImage);

    blockSize = 8;

    numBlocksRows = floor(rows / blockSize);
    numBlocksCols = floor(cols / blockSize);

    % Define quantization matrix (example matrix)
    Q = [16 11 10 16 24 40 51 61;
         12 12 14 19 26 58 60 55;
         14 13 16 24 40 57 69 56;
         14 17 22 29 51 87 80 62;
         18 22 37 56 68 109 103 77;
         24 35 55 64 81 104 113 92;
         49 64 78 87 103 121 120 101;
         72 92 95 98 112 100 103 99];

    % Initialize an array to store the reconstructed image
    reconstructedImage = zeros(rows, cols, 3, 'uint8');

    blockIndex = 1;
    for i = 1:numBlocksRows
        for j = 1:numBlocksCols
            % Extract the current block
            dct_block = blocks(:, :, :, blockIndex);
            idct_block = zeros(blockSize, blockSize, 3);
            for channel = 1:3
                % Dequantize
                dequantized_block = double(dct_block(:,:,channel)) .* Q;
                % Apply IDCT
                idct_block(:,:,channel) = idct2(dequantized_block);
            end
            % Place the reconstructed block in the image
            reconstructedImage((i-1)*blockSize+1:i*blockSize, (j-1)*blockSize+1:j*blockSize, :) = uint8(idct_block);
            blockIndex = blockIndex + 1;
        end
    end

    % Display the reconstructed image
    figure;
    imshow(reconstructedImage);
end
