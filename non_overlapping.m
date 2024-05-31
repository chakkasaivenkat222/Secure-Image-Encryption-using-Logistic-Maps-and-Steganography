% Read the input image
input_image = imread('monkey.jpg'); % Provide the path to your input image

% Convert the image to grayscale if it's not already
figure;
subplot(1,2,1);
imshow(input_image);
title('Original Image');
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
end

% Divide the image into 8x8 non-overlapping blocks
block_size = 8;
[num_rows, num_cols] = size(input_image);
num_blocks_rows = floor(num_rows / block_size);
num_blocks_cols = floor(num_cols / block_size);
output_image = zeros(num_rows, num_cols, 'uint8');

% Iterate through each block
for i = 1:num_blocks_rows
    for j = 1:num_blocks_cols
        % Extract the current block
        current_block = input_image((i-1)*block_size + 1:i*block_size, (j-1)*block_size + 1:j*block_size);
        % Clear the 3 LSB bits for all pixels in each row of the block
        for k = 1:size(current_block, 1)
            current_block(k,:) = bitand(current_block(k,:), bitcmp(7, 'uint8'));
        end
        % Assign the modified block to the output image
        output_image((i-1)*block_size + 1:i*block_size, (j-1)*block_size + 1:j*block_size) = current_block;
    end
end

% Display the original and modified images

subplot(1,2,2);
imshow(output_image);
title('Modified Image');
