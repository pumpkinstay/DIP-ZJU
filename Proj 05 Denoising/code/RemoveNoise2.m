% RemoveNoise
% 利用算术均值和几何均值去噪
% Author: Wu Jiangnan   2019/3/25
% 

clear all;
close all;
clc;   

img=imread('girl.png');      
img=im2double(img(:,:,1)); % 3 dimensions to 2 dim

%% Salt & Pepper

% Add  Salt & Pepper noise


figure
subplot(1,3,1);
imgNoise = imnoise(img, 'salt & pepper',0.2); 
imshow(imgNoise);title('salt & pepper noise');

% Mean Filter
subplot(1,3,2);
img1=fspecial('average',[3,3]);               
img1=imfilter(imgNoise,img1);                               %arithmetic mean        
imshow(img1);title('3*3  arithmetic mean');
subplot(1,3,3);
img2=exp(imfilter(log(imgNoise),fspecial('average',3)));  %geometric mean
imshow(img2);title('3*3  geometric mean');

%% Gauss

figure
subplot(1,3,1);
I_noise=imnoise(img,'gaussian',0.02);
imshow(I_noise);title('Gauss noise');

% Mean Filter
subplot(1,3,2);
I_1=fspecial('average',[3,3]);               
I_1=imfilter(I_noise,I_1);                               %arithmetic mean        
imshow(I_1);title('3*3  arithmetic mean');
subplot(1,3,3);
I_2=exp(imfilter(log(I_noise),fspecial('average',3)));  %geometric mean
imshow(I_2);title('3*3  geometric mean');