
% Gauss LPF

clear all;clc;   
                                                
img=imread('house.tif');                                    %Import image
f=im2double(img(:,:,1)); 
f_fft=fftshift(fft2(f)); 
%Gaussian end frequency 
D1 = 0.1;

% img=imread('lena.tif');
% f=im2double(img(:,:,1)); 
% f_fft=fftshift(fft2(f)); 
% 
% D1= 0.4£»
 
f_fft=fftshift(fft2(f)); 


% Generate filering transformation H
Hd1= GaussLPF(f,D1 );

Y1=Hd1.*f_fft;        

output1=ifft2( ifftshift(Y1) );  

%% Figure 

figure;

imshow(abs(output1)); title('after filter');




