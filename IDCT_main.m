blocks=DCT_alone('lena_ycomp_img.jpg');
inverse_image=IDCT(blocks,imageSize);
imshow(inverse_image);