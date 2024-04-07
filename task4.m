clear
clc
I = imread("grayscale_brain.png"); % Read the Grayscale Biomedical Image
I_2 = imread("grayscale_brain_2.png"); % Read the Grayscale Biomedical Image
Ig = im2gray(I); % Ensuring about image is grayscale
Ig2 = im2gray(I_2); % Ensuring about image is grayscale
m = 5; % 'm' represents the number of rows in the neighborhood window.
n = 5; % 'n' represents the number of columns in the neighborhood window.
d = 1; % d is the parameter specifying the number of pixels to be trimmed from
windowsize = [4,4]; % Fitler Window Size for alpha-trimmed mean filter
% both ends in the alpha-trimmed mean filter.
sigma_spat = 7; % sigma_spat controls the spatial extent of filtering in the bilateral filter.
sigma_int = 3; % controls the intensity difference allowed between neighboring pixels in the bilateral filter.

% We use two biomedical image for better comparison about the effect of filters 

%Median Filter
filtered_med_image = medfilt2(Ig,[m,n]);
filtered_med_image2 = medfilt2(Ig2,[m,n]);

%Minimum Filter
filtered_med_image3 = ordfilt2(Ig,2,ones(m,n));
filtered_med_image4 = ordfilt2(Ig2,2,ones(m,n));

%Maximum Filter
filtered_med_image5 = ordfilt2(Ig,m*n,ones(m,n));
filtered_med_image6 = ordfilt2(Ig2,m*n,ones(m,n));

%Midpoint Filter
min_filtered = ordfilt2(Ig,1,ones(m,n));
max_filtered = ordfilt2(Ig,m*n,ones(m,n));
min_filtered2 = ordfilt2(Ig2,1,ones(m,n));
max_filtered2 = ordfilt2(Ig2,m*n,ones(m,n));
filtered_med_image7 = (min_filtered + max_filtered) / 2;
filtered_med_image8 = (min_filtered2 + max_filtered2) / 2;

%Alpha-Trimmed Mean Filter
filtered_med_image9 = medfilt2(Ig,windowsize,"symmetric");
filtered_med_image10 = medfilt2(Ig2,windowsize,'symmetric');

%Bilateral Filter
filtered_med_image11 = imbilatfilt(Ig,sigma_spat,sigma_int);
filtered_med_image12 = imbilatfilt(Ig2,sigma_spat,sigma_int);

figure
subplot(2,4,1), imshow(Ig), title('Original Image')
subplot(2,4,2), imshow(filtered_med_image), title('Median Filt. Image')
subplot(2,4,3), imshow(filtered_med_image3), title('Minimum Filt. Image')
subplot(2,4,4), imshow(filtered_med_image5), title('Maximum Filt. Image')
subplot(2,4,5), imshow(Ig), title('Original Image')
subplot(2,4,6), imshow(filtered_med_image7), title('Midpoint Filt. Image')
subplot(2,4,7), imshow(filtered_med_image9), title('Alpha-Trimmed Filt. Image')
subplot(2,4,8), imshow(filtered_med_image11), title('Bilateral Filt. Image')
figure
subplot(2,4,1), imshow(Ig2), title('Original Image')
subplot(2,4,2), imshow(filtered_med_image2), title('Median Filt. Image')
subplot(2,4,3), imshow(filtered_med_image4), title('Minimum Filt. Image')
subplot(2,4,4), imshow(filtered_med_image6), title('Maximum Filt. Image')
subplot(2,4,5), imshow(Ig2), title('Original Image')
subplot(2,4,6), imshow(filtered_med_image8), title('Midpoint Filt. Image')
subplot(2,4,7), imshow(filtered_med_image10), title('Alpha-Trimmed Filt. Image')
subplot(2,4,8), imshow(filtered_med_image12), title('Bilateral Filt. Image')