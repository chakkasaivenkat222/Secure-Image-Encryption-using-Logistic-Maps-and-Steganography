blocks = divideImageIntoBlocks('lena_ycomp_img.jpg'); 
% Assuming 'blocks' is the result of your divideImageIntoBlocks function
reconstructedImage = reverseDCT(blocks, 'lena_quantization_img.jpg');
