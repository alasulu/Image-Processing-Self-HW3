clear
clc
I = imread('grayscale_brain.png');
%Arithmetic Filters, Noise Adding & Filter Applying
A1 = 5; %Coefficient for Matrix Size of Arithmetic Filters
A2 = 5; %%Coefficient for Matrix Size of Arithmetic Filters
arithmetic_filt = fspecial('average', [A1, A2]); %Creating Arithmetic Filter
salt_noise = imnoise(I, 'salt & pepper'); %Creating Salt Noise
gaussian_noise = imnoise(I, 'gaussian'); %Creating Gaussian Noise
salt_noise_arithmetic = imfilter(salt_noise, arithmetic_filt, 'conv', 'replicate', 'same'); %Filtering Salt Noise with Arithmetic Filter
gaussian_noise_arithmetic = imfilter(gaussian_noise, arithmetic_filt, 'conv', 'replicate', 'same'); %Filtering Gaussian Noise with Arithmetic Filter
original_filtering = imfilter(I, arithmetic_filt, 'conv', 'replicate', 'same'); %Filtering Original Image with Arithmetic Filter
subplot(2, 3, 1); imshow(I); title('Original Image');
subplot(2, 3, 2); imshow(salt_noise); title('Salt & Pepper Noise of Image');
subplot(2, 3, 3); imshow(gaussian_noise); title('Gaussian Noise of Image');
subplot(2, 3, 4); imshow(original_filtering, []); title('Arithmetic Filter on Original');
subplot(2, 3, 5); imshow(salt_noise_arithmetic, []); title('Arithmetic Filter on Salt & Pepper Noise');
subplot(2, 3, 6); imshow(gaussian_noise_arithmetic, []); title('Arithmetic Filter on Gaussian Noise');
%-------------------------------------------------%
% Geometric Filter, Noise Adding & Filter Applying
salt_noise2 = imnoise(I, 'salt & pepper'); %Creating Salt Noise
gaussian_noise2 = imnoise(I, 'gaussian'); %Creating Gaussian Noise
G1 = 7; %Coefficient for Matrix Size of Geometric Filters
G2 = 7; %Coefficient for Matrix Size of Geometric Filters
doub_noise_salt = im2double(salt_noise2); %Converting to double the Salt & Pepper image
doub_noise_gaussian = im2double(gaussian_noise2); %Converting to double the Gaussian image
doub_original = im2double(I); %Converting to double the original image
salt_noise_geometric = exp(imfilter(log(doub_noise_salt), ones(G1, G2), 'replicate')).^(1 / (G1 * G2)); %Filtering Salt Noise with Geometric Filter
gaussian_noise_geometric = exp(imfilter(log(doub_noise_gaussian), ones(G1, G2), 'replicate')).^(1 / (G1 * G2)); %Filtering Gaussian Noise with Geometric Filter
original_filtering2 = exp(imfilter(log(doub_original), ones(G1, G2), 'replicate')).^(1 / (G1 * G2)); %Filtering Original Image with Geometric Filter
figure
subplot(2, 3, 1); imshow(I); title('Original Image');
subplot(2, 3, 2); imshow(salt_noise2); title('Salt & Pepper Noise of Image');
subplot(2, 3, 3); imshow(gaussian_noise2); title('Gaussian Noise of Image');
subplot(2, 3, 4); imshow(original_filtering2); title('Geometric Filter on Original');
subplot(2, 3, 5); imshow(salt_noise_geometric); title('Geometric Filter on Salt & Pepper Noise');
subplot(2, 3, 6); imshow(gaussian_noise_geometric); title('Geometric Filter on Gaussian Noise');
%-------------------------------------------------%
% Harmonic Mean Filter, Noise Adding & Filter Applying
% Adding Salt & Pepper and Gaussian noise to the original image
H1 = 2; %Coefficient for Matrix Size of Harmonic Mean Filters
H2 = 2; %Coefficient for Matrix Size of Harmonic Mean Filters
salt_noise3 = imnoise(I, 'salt & pepper'); %Creating Salt Noise
gaussian_noise3 = imnoise(I, 'gaussian'); %Creating Gaussian Noise
% Applying Harmonic Mean Filter to the noisy images
doub_noise_salt2 = im2double(salt_noise3); %Converting to double the Salt & Pepper image
doub_noise_gaussian2 = im2double(gaussian_noise3); %Converting to double the Gaussian image
doub_original_2 = im2double(I); %Converting to double the original image
salt_noise_harmonic = (H1 * H2) ./ imfilter(1 ./ (doub_noise_salt2 + eps), ones(H1, H2), 'replicate'); %Filtering Salt Noise with Harmonic Filter
gaussian_noise_harmonic = (H1 * H2) ./ imfilter(1 ./ (doub_noise_gaussian2 + eps), ones(H1, H2), 'replicate'); %Filtering Gaussian Noise with Harmonic Filter
original_filtering3 = (H1 * H2) ./ imfilter(1 ./ (doub_original_2 + eps), ones(H1, H2), 'replicate'); %Filtering Original Image with Harmonic Filter
figure;
subplot(2, 3, 1); imshow(I); title('Original Image');
subplot(2, 3, 2); imshow(salt_noise3); title('Salt & Pepper Noise of Image');
subplot(2, 3, 3); imshow(gaussian_noise3); title('Gaussian Noise of Image');
subplot(2, 3, 4); imshow(original_filtering3); title('Harmonic Filter on Original');
subplot(2, 3, 5); imshow(salt_noise_harmonic); title('Harmonic Filter on Salt & Pepper Noise');
subplot(2, 3, 6); imshow(gaussian_noise_harmonic); title('Harmonic Filter on Gaussian Noise');
%-------------------------------------------------%
% Contraharmonic Mean Filter, Noise Adding & Filter Applying
C1 = 3; %Coefficient for Matrix Size of Contraharmonic Mean Filters
C2 = 6; %Coefficient for Matrix Size of Contraharmonic Mean Filters
C3 = 6; %Coefficient for Matrix Size of Contraharmonic Mean Filters
salt_noise4 = imnoise(I, 'salt & pepper'); %Creating Salt Noise
gaussian_noise4 = imnoise(I, 'gaussian'); %Creating Gaussian Noise
doub_noise_salt3 = im2double(salt_noise4); %Converting to double the Salt & Pepper image
doub_noise_gaussian3 = im2double(gaussian_noise4); %Converting to double the Gaussian image
doub_original3 = im2double(I); %Converting to double the original image
salt_noise_contraharmonic = imfilter(doub_noise_salt3.^(C1 + 1), ones(C2, C3), 'replicate') ./ (imfilter(doub_noise_salt3.^(C1), ones(C2, C3), 'replicate') + eps); %Filtering Salt Noise with Contraharmonic Filter
gaussian_noise_contraharmonic = imfilter(doub_noise_gaussian3.^(C1 + 1), ones(C2, C3), 'replicate') ./ (imfilter(doub_noise_gaussian3.^(C1), ones(C2, C3), 'replicate') + eps); %Filtering Gaussian Noise with Contraharmonic Filter
original_filtering4 = imfilter(doub_original3.^(C1 + 1), ones(C2, C3), 'replicate') ./ (imfilter(doub_original3.^(C1), ones(C2, C3), 'replicate') + eps); %Filtering Original Image with Contraharmonic Filter
figure;
subplot(2, 3, 1); imshow(I); title('Original Image');
subplot(2, 3, 2); imshow(doub_noise_salt3); title('Salt & Pepper Noise of Image');
subplot(2, 3, 3); imshow(doub_noise_gaussian3); title('Gaussian Noise of Image');
subplot(2, 3, 4); imshow(original_filtering4, []); title('Contraharmonic Filter on Original');
subplot(2, 3, 5); imshow(salt_noise_contraharmonic, []); title('Contraharmonic Filter on Salt & Pepper Noise');
subplot(2, 3, 6); imshow(gaussian_noise_contraharmonic, []); title('Contraharmonic Filtered Image with Gaussian Noise');