% Image Sharping 
% function:利用Sobel、Laplacian、high-boost等方法进行边缘检测和图像锐化
% Author: Wu Jiangnan 2019/4/5
% 

clc;clear all;

Img=imread('bicycle.jpg');
Img=im2double(Img);  % uint8 to double
f=Img(:,:,1);        % 3 dimension to 2 dimension
f=imresize(f,0.3);   % Shrink the image 
[SizeX,SizeY] = size(f);


%% edge detecting

GR=f;
GP=f;
GS=f;
GL=f;
for x=2:SizeX-1
    for y=2:SizeY-1
        % Roberts
        GRx(x,y)=f(x,y)-f(x+1,y+1);
        GRy(x,y)=f(x,y+1)-f(x+1,y);
        GR(x,y)=sqrt((GRx(x,y)).^2+(GRy(x,y)).^2);
        % Prewitt
        GPx(x,y)=(f(x-1,y+1)+f(x,y+1)+f(x+1,y+1))/3-(f(x-1,y-1)+f(x,y-1)+f(x+1,y-1))/3;
        GPy(x,y)=(f(x-1,y-1)+f(x-1,y)+f(x-1,y+1))/3-(f(x+1,y-1)+f(x+1,y)+f(x+1,y+1))/3;
        GP(x,y)=sqrt((GPx(x,y)).^2+(GPy(x,y)).^2);
        % Sobel
        GSx(x,y)=(f(x-1,y+1)+2*f(x,y+1)+f(x+1,y+1))/3-(f(x-1,y-1)+2*f(x,y-1)+f(x+1,y-1))/3;
        GSy(x,y)=(f(x-1,y-1)+2*f(x-1,y)+f(x-1,y+1))/3-(f(x+1,y-1)+2*f(x+1,y)+f(x+1,y+1))/3;
        GS(x,y)=sqrt((GSx(x,y)).^2+(GSy(x,y)).^2);
        % Laplacian with diagonal terms
        GL(x,y)=8*f(x,y)-f(x-1,y-1)-f(x-1,y)-f(x-1,y-1)-f(x,y-1)-f(x,y+1)-...
                           f(x+1,y-1)-f(x+1,y)-f(x+1,y+1);
    end
end

        % high-boosting 
        w = fspecial('gaussian',[5,5],1); 
        fGauss = imfilter(f,w,'replicate'); % Gaussian filter -image blurring
        Gmask= f - fGauss;
        
       
%% figure - edge
figure
subplot(2,2,1);
imshow(GL,[0,1]);title('Laplacian');
subplot(2,2,2);
imshow(GR,[0,1]);title('Roberts');
subplot(2,2,3);
imshow(GP,[0,1]);title('Prewitt');
subplot(2,2,4);
imshow(GS,[0,1]);title('Sobel');
figure; imshow(Gmask);title('Gmask(using Gaussian)');

figure
imshow(f,[0,1]);title('原图像');

%% figure- after sharping 

figure; imshow(f+0.5*GL);title('Laplacian');
figure; imshow(f+0.5*GR);title('Roberts');
figure; imshow(f+0.5*GP);title('Prewitt');
figure; imshow(f+0.5*GS);title('Sobel');             % (weight)c=0.5
figure; imshow(f+3.5*Gmask);title('High-boosting   k=3.5 '); %High-boosting k=3.5

%% Laplacian  alpha=0.5 \ 1 \ 2



figure;imshow(f+0.5*GL);title('Laplacian  \alpha=0.5');
figure;imshow(f+1*GL);title('Laplacian  \alpha=1');
figure;imshow(f+2*GL);title('Laplacian  \alpha=2');

%% Unsharp masking & High-boost 
figure; imshow(fGauss);title('Gauss');
figure; imshow(f+Gmask);title('Unsharp masking   k=1');  %Unsharp masking  k=1
figure; imshow(f+4*Gmask);title('High-boost   k=4');  % k=4
figure; imshow(f+20*Gmask);title('High-boost   k=20');  % k=20