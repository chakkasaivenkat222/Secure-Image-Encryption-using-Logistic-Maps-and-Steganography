% Read the YCbCr image
ycbcrImage = imread('lena_ycbcr_img.jpg');

% Extract the Y component (luminance)
yComponent = ycbcrImage(:,:,1);

% Display the extracted Y component
figure;
imshow(yComponent);
