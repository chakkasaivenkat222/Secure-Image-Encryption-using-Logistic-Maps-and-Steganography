function decryptedImage = decryptImage(encryptedImage, sortingIndices)
    % Convert encrypted image to 1D array
    encryptedArray = reshape(encryptedImage, 1, []);

    % Reverse the sorting process
    [~, reverseSortIndex] = sort(sortingIndices); 
    decryptedArray = encryptedArray(reverseSortIndex);

    % Reshape decrypted array to image dimensions
    decryptedImage = reshape(decryptedArray, size(encryptedImage));
end
function sequence = logisticMap(r, x0, iterations)
    sequence = zeros(1, iterations);
    x = x0;
    for i = 1:iterations
        x = r * x * (1 - x);
        sequence(i) = x;
    end
end