function [encryptedImage,sortingIndices] = encryptImage(inputImage)
    % Read the original image
    originalImage = imread(inputImage);
    % Convert image to 1D array
    originalArray = reshape(originalImage, 1, []);

    % Chaotic parameter and initial condition
    r = 3.999;
    x0 = 0.999;

    % Number of iterations
    iterations = numel(originalArray);

    % Generate chaotic sequence
    chaoticSequence = logisticMap(r, x0, iterations);

    % Diffusion using sorting
    [~, sortingIndices] = sort(chaoticSequence);
    encryptedArray = originalArray(sortingIndices);

    % Reshape encrypted array to image dimensions
    encryptedImage = reshape(encryptedArray, size(originalImage));
    figure;
    imshow(encryptedImage);
    ycbcr_image=rgb2ycbcr(encryptedImage);
    figure;
    imshow(ycbcr_image);
end

function sequence = logisticMap(r, x0, iterations)
    sequence = zeros(1, iterations);
    x = x0;
    for i = 1:iterations
        x = r * x * (1 - x);
        sequence(i) = x;
    end
end