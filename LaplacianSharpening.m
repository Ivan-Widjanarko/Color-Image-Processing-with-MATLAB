clc
close all
clear all

image = imread('./Input/image_3.tif');



[rows, columns] = size(image);

HSV = rgb2hsv(image);

H = HSV(:,:,1);
S = HSV(:,:,2);
% I = (R + G + B) / 3
I = HSV(:,:,3);

newI = ApplyLaplacian(I);


HSV(:,:,3) = newI;
rgbResult = hsv2rgb(HSV);


subplot(1,2,1); imshow(image)
title('Original Image');
subplot(1,2,2); imshow(rgbResult)
title('Sharpened Image');
