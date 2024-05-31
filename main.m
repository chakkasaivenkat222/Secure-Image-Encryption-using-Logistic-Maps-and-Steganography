function main()
    encryptedImage = imread('SASTRA123_x.jpg'); % Load the encrypted image
    r = 3.999; % Chaotic parameter used during encryption
    x0 = 0.999; % Initial condition used during encryption

    % Decrypt the image
    decryptedImage = decryptImage(encryptedImage, r, x0);

    % Display the decrypted image
    imshow(uint8(decryptedImage));
    title('Decrypted Image');
end

% Call the main function
main();
