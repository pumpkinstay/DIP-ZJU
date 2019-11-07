% RemoveNoise
% 利用中值滤波模板去除含噪声图像中的椒盐噪声
% Author: Wu Jiangnan   2019/3/25
% 
clear all;
close all;
clc;                                                  

img=imread('match.tif');                               
imgNoise = imnoise(img, 'salt & pepper',0.2); % Add  Salt & Pepper noise
N1=3;
N2=5;
[m,n]=size(imgNoise);
out1=MedianFilter(imgNoise,N1);
out2=MedianFilter(imgNoise,N2);

%% figure
figure;
subplot(1,2,1)
imshow(img);
title('Original Image');
subplot(1,2,2)
imshow(imgNoise);
title('Image with salt&pepper noise');

figure;
subplot(1,2,1)
imshow(out1(N1+1:m+N1,N1+1:n+N1));
title('After MedianFilter 3*3');
subplot(1,2,2)
imshow(out2(N2+1:m+N2,N2+1:n+N2));
title('After MedianFilter 5*5');

