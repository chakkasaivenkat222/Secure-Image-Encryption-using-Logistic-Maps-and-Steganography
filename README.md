# Secure-Image-Encryption-using-Logistic-Maps-and-Steganography

This project clearly discusses about how the color image is being encrypted using the 1D chaotic map and 
how the Stego-Encrypted image is generated from the input data taken from the user. Initially a input color image 
of 256*256 size is taken. This color image is undergone through the encryption using the simple logistic map. 
Then the confusion and diffusion processes are done for increasing security. So as the encrypted image is of the 
type RGB form, it is converted to YCbCr form. Y component is extracted from it and it is divided into 8*8 non
overlapping blocks. Each block is undergone through the Discrete Cosine Transform (DCT) process and 
Quantization is applied to each block. On the other side, data is taken as input from the user. Run Length encoding 
technique is used to encode the input text. The stream of binary data generated is utilized for embedding into 
quantized image. As the pixel is of 8-bit binary data, the last 3 bits of each pixel are replaced with the first 3 bits 
of run length encoded bits and so on. So, finally the stego-encrypted image is generated. The result will show the 
stego-encrypted image which has a embedding capacity of 1,96,608 bits.  
