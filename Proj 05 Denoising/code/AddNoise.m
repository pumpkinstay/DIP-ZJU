
clear all;clc;  


img=imread('match.tif');
[width,height,z]=size(img);
if(z>1)
    img=rgb2gray(img);
end


%% 加高斯


av=0;       % 可改变曝光度
A=0.2;   % 高斯噪声幅度
u1=rand(width,height);
u2=rand(width,height);
x=A*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
result1=double(img)/255+x;
result1=uint8(255*result1);

figure(2);
subplot(1,2,1);
imshow(img);
title('原图');
subplot(1,2,2);
imshow(result1);
title('加高斯噪声后');
%% 加椒盐噪声

result2=img;

p=0.1;         % 概率
WhiteBlack=0.3;  % 白黑噪点比例 WhiteBlack=0.5即一半黑一半白
a1=rand(width,height)<p;
a2=rand(width,height)<WhiteBlack;
result2(a1&a2)=0;
result2(a1& ~a2)=255;

figure(2);
subplot(1,2,1);
imshow(img);
title('原图');
subplot(1,2,2);
imshow(result2);
title('加椒盐噪声后');



