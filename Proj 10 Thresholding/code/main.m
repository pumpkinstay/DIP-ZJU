
% 函数说明： 主函数
%   计算 basic global threshold、otsu threshold、otsu double threshold
%   
%

 clc;clear;close all;

 
 %% 测试图A
  imgA =imread('Fig1039(a)(polymersomes).tif');
 % 阈值计算
 BasicT =BasicGlobalThreshold(imgA);        
 J1 = imbinarize(imgA,BasicT);                    %图像二值化
 otsuT =otsuThresh(imgA);                   
 J2 = imbinarize(imgA,otsuT);                    %图像二值化

% close all
 figure 
 subplot 121
 imshow(imgA);title('原图像');
 subplot 122
 imhist(imgA)
 figure
 subplot 121
 imshow(J1);title('global threshold');
 subplot 122
 imshow(J2);title('otsu threshold');
 
  %% 测试图B

  
 imgB =imread('window.jpg');
 imgB=rgb2gray(imgB);
 imgB=im2double(imgB);
  
 
 BasicT2 =BasicGlobalThreshold(imgB);        
 J3 = imbinarize(imgB,BasicT2);                    %图像二值化
 otsuT2 =otsuThresh(imgB);                   
 J4 = imbinarize(imgB,otsuT2);                    %图像二值化
 
 figure 
  subplot 121
 imshow(imgB);title('原图像');
 subplot 122
 imhist(imgB)
 figure
 subplot 121
 imshow(J3);title('global threshold');
 subplot 122
 imshow(J4);title('otsu threshold');
 
 %% 先平滑图B再取阈值效果 去高频
%  close all
 gaussH=fspecial('gaussian',[5 5],10);
 smoothB=imfilter(imgB,gaussH);
 
%  smoothB=wiener2(imgB);

 BasicT2 =BasicGlobalThreshold(smoothB);        
 J5 = imbinarize(smoothB,BasicT2);                    %图像二值化
 otsuT2 =otsuThresh(smoothB);                   
 J6 = imbinarize(smoothB,otsuT2);                    %图像二值化

  figure 
  subplot 121
 imshow(smoothB);title('平滑滤波后');
 subplot 122
 imhist(smoothB)
 figure
 subplot 121
 imshow(J5);title('global threshold');
 subplot 122
 imshow(J6);title('otsu threshold');
 
 %% 双阈值 用书上例子测试代码正确性
 
 imgC=imread('iceberg.tif');  % 用书上例子的图片测试,验证算法正确与否
 

 [t1,t2] =DoubleOtsuThresh(imgC); 
 T1=t1*255;
 T2=t2*255;
J7=img2gray(imgC,T1,T2);
 figure
 subplot 121
 imshow(imgC);title('原图C');
 subplot 122
 imshow(J7,[]);title('双阈值');
 disp(['     otsu双阈值为：   ' ,'t1=',num2str(T1),'     t2=',num2str(T2)])
 
 % 结果和书上的一样
 
  %% 双阈值 用自己的两张图片测试
%  close all
  % —— 图B —— %
 [t1B,t2B] =DoubleOtsuThresh(smoothB);    

% 如果是unit8类型 要乘255，[0,1]的double类型不乘
%  T1B=t1B*255;   
%  T2B=t2B*255;

 T1B=t1B;  
 T2B=t2B;
 

J9=img2gray(smoothB,T1B,T2B);

  figure 
 imshow(J9,[]);title('平滑+双阈值分割');
 
%%
 % —— 图D —— %


  imgD=imread('ladder.jpg');
%   imgD=rgb2gray(imgD);
 [t1D,t2D] =DoubleOtsuThresh(imgD);    

 T1D=t1D*255;
 T2D=t2D*255;
  % 分为 0 127 255 显示
  
J8=img2gray(imgD,T1D,T2D);

 
 figure 
 subplot 121
 imshow(imgD);title('原图D');

subplot 122
 imshow(J8,[]);title('双阈值分割');
 
 %% 彩色图E


  imgE=imread('piano.jpg');
  imgE=rgb2gray(imgE);
 [t1E,t2E] =DoubleOtsuThresh(imgE);    

 T1E=t1E*255;
 T2E=t2E*255;

   % 分为 0 127 255 显示
  
J10=img2gray(imgE,T1E,T2E);

 figure 
 subplot 121
 imshow(imgE);title('原图E');

 subplot 122
 imshow(J10,[]);title('双阈值分割');
 