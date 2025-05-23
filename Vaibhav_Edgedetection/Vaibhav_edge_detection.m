%Edge Detection
%Created by Sriram Vaibhav
% Read the input image
clear all;
close all;
clc;
I = imread('C:\Users\penja\Downloads\mouse.jpeg');
I_gray = rgb2gray(I);  % Convert to grayscale
I_gray = double(I_gray);  % Convert to double for computations

% Sobel filters for x and y gradients
Sx = [-1 0 1; -2 0 2; -1 0 1];  % Horizontal Sobel filter
Sy = [-1 -2 -1; 0 0 0; 1 2 1];  % Vertical Sobel filter

% Apply convolution using conv2
Gx = conv2(I_gray, Sx, 'same');
Gy = conv2(I_gray, Sy, 'same');

% Compute the gradient magnitude
G = sqrt(Gx.^2 + Gy.^2);
G = G / max(G(:)) * 255;  % Normalize to 0-255

% Display the original and edge-detected images
subplot(1, 2, 1);
imshow(I_gray, []);  % Display original grayscale image
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(G));  % Display edge-detected image
title('Edge Detection');
