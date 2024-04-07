% We use two biomedical image for better comparison about the effect of filters 

clear
clc
I = imread("grayscale_brain.png"); %Image Importing
I2 = imread("grayscale_brain_2.png"); %Image Importing 2
Ig = im2gray(I); % Converting Grayscale to Being Ensure
Ig2 = im2gray(I2); % Converting Grayscale to Being Ensure 2
% Is = imsharpen(Ig); % Sharpen Image Using Unsharp Masking With a Function
sharp_kernel = [0 -1 0; -1 5 -1;0 -1 0]; % Creating a Sharp Kernel
unsharp_kernel = fspecial('gaussian',[5,5],3); %Creating a Unsharp Kernel
Ius = Ig - imfilter(Ig,unsharp_kernel); % Implementation of Unsharp Kernel
Is_k = imfilter(Ig, sharp_kernel); % Implementation of Sharp Kernel
imshowpair(Is_k,Ius,"montage") % Show in Figure
Ius2 = Ig2- imfilter(Ig2,unsharp_kernel); % Implementation of Unsharp Kernel
Is_k2 = imfilter(Ig2,sharp_kernel); % Implementation of Sharp Kernel
figure
imshowpair(Is_k2, Ius2,"montage") % Show in Figure
title("Sharp Kernel vs. Unsharp Kernel")