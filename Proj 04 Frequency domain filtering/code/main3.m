% edge detecting using Gauss HPF

clear all;clc;   
img=imread('house.tif'); 
% img = mread('match.tif');  % »ð²ñÍ¼Æ¬
f=im2double(img(:,:,1)); 
f_fft=fftshift(fft2(f)); 

D1 = 0.2;                                 %Gaussian end frequency 
D2 = 0.07;


% Generate filering transformation H
Hd1= GaussHPF(f,D1 );
Hd2= GaussHPF(f,D2 );
                        
Y1=f_fft.*Hd1;                                                %Apply high-pass filtering
Y2=f_fft.*Hd2;  
output1=abs(ifft2(ifftshift(Y1)));                        %Ifft and get the real part
output2=abs(ifft2(ifftshift(Y2))); 
%% Figure 
figure;
subplot(1,2,1)
imshow(abs(Hd1));  title('Filter D=0.2');
subplot(1,2,2)
imshow(mat2gray(output1));
title('After Gaussian HPF');

figure;
subplot(1,2,1)
imshow(abs(Hd2));  title('Filter D=0.07');
subplot(1,2,2)
imshow(mat2gray(output2));
title('After Gaussian HPF');