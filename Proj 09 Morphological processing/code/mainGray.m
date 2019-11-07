%% 灰度图的交 差 补 
% —— Grey —— %
close all;
clc;
clear;

CarOnTheRoad=im2double(imread('CarOnTheRoad.tif'));

NoCar=im2double(imread('NoCar.tif'));

ImgA=CarOnTheRoad;
ImgB= NoCar; 

diff=differencing(ImgA,ImgB);  % 求差
intersec=intersection(ImgA,ImgB);  % 求交
imple=complement(ImgB);  % 求补
figure 
subplot 121
imshow(ImgA);
title('A');

subplot 122
imshow(ImgB);
title('B');

figure
subplot 221
imshow(diff,[]);   % 检测出车辆
title('A - B');

subplot 222
imshow(intersec,[]);
title('A \cap B');

subplot 223
imshow(imple,[]);
title('B^c');
%% 灰度图的腐蚀膨胀
starGray=imread('star.tif');


SE2=ones(3,3);
[s_dilate,s_erode]=DilateErode_GrayImg(starGray,SE2);


figure

subplot 221
imshow(starGray);
title('Orignal image');

subplot 222
imshow(s_dilate);
title('Dilate');

subplot 223
imshow(s_erode);
title('Erode');

%% 形态学梯度 = 膨胀-腐蚀
C=imread('tungsten.tif');
C=im2double(C);

[c_dilate,c_erode]=DilateErode_GrayImg(C,SE2);

c_subtract=differencing(c_dilate,c_erode);  % 形态学梯度
[c_open,~]=DilateErode_GrayImg(c_erode,SE2);  % 开运算
figure
subplot 121
imshow(C);
title('Orignal image');

subplot 122

imshow(c_open,[]);
title('open');


figure
subplot 121
imshow(c_subtract,[]);
title('subtract');  % 形态学梯度提取的边界 

subplot 122
imshow(C-c_erode,[]);
title('Boundary');    % 简单的边界提取 

