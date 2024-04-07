% We use two biomedical image for better comparison about the effect of filters 

I = imread("grayscale_brain.png"); %Image Importing
I2 = imread("grayscale_brain_2.png"); %Image Importing 2

Ig = im2gray(I);
Ig2 = im2gray(I2);

sigma = 5;
filter_size = 16;
log_filter = fspecial('log', filter_size, sigma); % Create a LoG filter
log_result = imfilter(Ig, log_filter,"replicate","same");
log_result2 = imfilter(Ig2, log_filter,"replicate","same");

sigma2 = 3;
sigma3 = 4;
dog_filter1 = fspecial('gaussian',filter_size,sigma2);
dog_filter2 = fspecial('gaussian',filter_size,sigma3);
dog_filter = dog_filter1 - dog_filter2;
dog_result = imfilter(Ig,dog_filter,"replicate","same");
dog_result2 = imfilter(Ig2,dog_filter,"replicate","same");

figure
subplot(2,3,1), imshow(Ig), title('Original Image')
subplot(2,3,2), imshow(log_result,[]), title('LoG Result 1')
subplot(2,3,3), imshow(dog_result,[]), title('DoG Result 1')
subplot(2,3,4), imshow(Ig2), title('Original Image 2')
subplot(2,3,5), imshow(log_result2,[]), title('LoG Result 2')
subplot(2,3,6), imshow(dog_result2,[]), title('DoG Result 2')