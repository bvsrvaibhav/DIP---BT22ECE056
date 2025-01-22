% Define the image URL
imageURL = 'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'; % Replace with your image link

% Read the image from the URL
img = webread(imageURL);

% Convert the image to grayscale
grayImg = rgb2gray(img);

% Get the size of the image
[rows, cols] = size(grayImg);

% Create a figure to display the bit planes
figure;
for bit = 7:-1:0  % Start from MSB (bit 7) to LSB (bit 0)
    % Extract the current bit plane
    bitPlane = bitget(grayImg, bit + 1);
    
    % Convert to 0-255 for display purposes
    bitPlaneImage = uint8(bitPlane * 255);
    
    % Display the bit-plane
    subplot(2, 4, 8-bit); % Arrange in a 2x4 grid
    imshow(bitPlaneImage);
    title(['Bit plane ', num2str(bit)]);
end

% Show the original grayscale image
figure;
imshow(grayImg);
title('Original Grayscale Image');
