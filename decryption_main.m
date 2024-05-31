[encryptedImage, sortingIndices] = encryptImage('lena.png');
decryptedImage = decryptImage(encryptedImage, sortingIndices);
figure;
subplot(1,3,1);
imshow('lena.png');
subplot(1,3,2);
imshow(encryptedImage);
subplot(1,3,3);
imshow(decryptedImage);
