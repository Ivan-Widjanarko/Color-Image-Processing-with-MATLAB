clc
close all
clear all

image = imread('./Input/image_2.tif');

figure(1);
imshow(image);

result = image;

red   = image(:,:,1);
green = image(:,:,2);
blue  = image(:,:,3);

[rows, columns, colorSpace] = size(image);

pixelNumber = rows * columns;

frequencyRed   = zeros(256, 1);
frequencyGreen = zeros(256, 1);
frequencyBlue  = zeros(256, 1);

for i=1:rows;
    for j=1:columns;
        % red.
        val = red(i,j);
        frequencyRed(val + 1)   = frequencyRed(val + 1) + 1;
        % blue.
        val = green(i,j);
        frequencyGreen(val + 1) = frequencyGreen(val + 1) + 1;
        % blue.
        val = blue(i,j);
        frequencyBlue(val + 1)  = frequencyBlue(val + 1) + 1;
    end
end

intensityLevel = 255;

% Cumulative value.
for i=2:(intensityLevel + 1);
    frequencyRed(i)   = frequencyRed(i)   + frequencyRed(i - 1);
    frequencyGreen(i) = frequencyGreen(i) + frequencyGreen(i - 1);
    frequencyBlue(i)  = frequencyBlue(i)  + frequencyBlue(i - 1);
end

% Get S function.
% Cumulative value / total pixel * max gray level and round it.
for i=1:(intensityLevel + 1);
    frequencyRed(i)   = round(frequencyRed(i) / pixelNumber * 255);
    frequencyGreen(i) = round(frequencyGreen(i) / pixelNumber * 255);
    frequencyBlue(i)  = round(frequencyBlue(i) / pixelNumber * 255);
end


for i = 1:1:rows
    for j = 1:1:columns
        result(i, j , 1) = frequencyRed(image(i, j, 1)   + 1);
        result(i, j , 2) = frequencyGreen(image(i, j, 2) + 1);
        result(i, j , 3) = frequencyBlue(image(i, j, 3)  + 1);
    end
end

figure(2);
imshow(result);

subplot(1,2,1); imshow(image)
title('Original Image');
subplot(1,2,2); imshow(result)
title('Equalize');