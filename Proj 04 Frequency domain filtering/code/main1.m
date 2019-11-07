
clc;clear all;close all;

img=imread('house.tif');  
f=im2double(img(:,:,1));  

f_fft=fft2(f);  
f_fft=fftshift(f_fft); 

% R of filter
r1=0.04;  % normalized  R
r2=0.1;
r3=0.5;

Hd1= LPfilter(f,r1 );
Hd2= LPfilter(f,r2 );
Hd3= LPfilter(f,r3 );

 % fitering
Y1=Hd1.*f_fft;        
Y2=Hd2.*f_fft; 
Y3=Hd3.*f_fft;  

output1=ifft2( ifftshift(Y1) );  
output2=ifft2( ifftshift(Y2) );  
output3=ifft2( ifftshift(Y3) );  

%% figure 
 
figure;
imshow(f);    title('original image');

figure;
subplot(2,2,1)
imshow(abs(Hd1));  title('filter-1 Radius=0.04');
subplot(2,2,2)
imshow(abs(Y1));    title('freq spectrum');
subplot(2,2,3)
imshow(abs(f_fft)); title('Original spectrum');
subplot(2,2,4)
imshow(abs(output1)); title('after filter');

figure;
subplot(2,2,1)
imshow(abs(Hd2));  title('filter-2 Radius=0.1');
subplot(2,2,2)
imshow(abs(Y2));    title('spectrum after filter');
subplot(2,2,3)
imshow(abs(f_fft)); title('Original spectrum');
subplot(2,2,4)
imshow(abs(output2)); title('after filter');

figure;
subplot(2,2,1)
imshow(abs(Hd3));  title('filter-3 Radius=0.5');
subplot(2,2,2)
imshow(abs(Y3));    title('freq spectrum');
subplot(2,2,3)
imshow(abs(f_fft)); title('Original spectrum');
subplot(2,2,4)
imshow(abs(output3)); title('after filter');
