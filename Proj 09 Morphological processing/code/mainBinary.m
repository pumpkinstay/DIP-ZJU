%%  初始化
clc;clear close all
A=imread('leaf.tif');
ABinary=logical(A);  % 保证它是二值图


B=imread('wirebond.tif');
B=double(B);



%% 二值图像 腐蚀膨胀


SE1=ones(3,3);
[A_dilate,A_erode]=DilateErode_BinaryImg(ABinary,SE1);

for k=1:2
    % 对这张图 只操作一次的效果不明显，重复操作几次
    [A_dilate,~]=DilateErode_BinaryImg(A_dilate,SE1);
    [~,A_erode]=DilateErode_BinaryImg(A_erode,SE1);
end

figure
subplot 221
imshow(ABinary);
title('Orignal image');

subplot 222
imshow(A_dilate);
title('Dilate');

subplot 223
imshow(A_erode);
title('Erode');

%% 二值的交 差 补 

% —— Binary —— %
ImgB=B;
ImgA=imresize(double(A),size(ImgB));  % 压缩图A，保证二图大小一样

diff=differencing(ImgA,ImgB);  % 求差
intersec=intersection(ImgA,ImgB);  % 求交
imple=complement(ImgB);  % 求补

figure
subplot 221
imshow(diff);
title('A - B');

subplot 222
imshow(intersec);
title('A \cap B');

subplot 223
imshow(imple);
title('B^c');

%% 边界提取
% 边界提取 = A- erode(A)
ABoundary=differencing(A,A_erode);
figure
imshow(ABoundary);
title('Boundary Extraction');



