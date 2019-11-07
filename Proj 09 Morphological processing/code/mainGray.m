%% �Ҷ�ͼ�Ľ� �� �� 
% ���� Grey ���� %
close all;
clc;
clear;

CarOnTheRoad=im2double(imread('CarOnTheRoad.tif'));

NoCar=im2double(imread('NoCar.tif'));

ImgA=CarOnTheRoad;
ImgB= NoCar; 

diff=differencing(ImgA,ImgB);  % ���
intersec=intersection(ImgA,ImgB);  % ��
imple=complement(ImgB);  % ��
figure 
subplot 121
imshow(ImgA);
title('A');

subplot 122
imshow(ImgB);
title('B');

figure
subplot 221
imshow(diff,[]);   % ��������
title('A - B');

subplot 222
imshow(intersec,[]);
title('A \cap B');

subplot 223
imshow(imple,[]);
title('B^c');
%% �Ҷ�ͼ�ĸ�ʴ����
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

%% ��̬ѧ�ݶ� = ����-��ʴ
C=imread('tungsten.tif');
C=im2double(C);

[c_dilate,c_erode]=DilateErode_GrayImg(C,SE2);

c_subtract=differencing(c_dilate,c_erode);  % ��̬ѧ�ݶ�
[c_open,~]=DilateErode_GrayImg(c_erode,SE2);  % ������
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
title('subtract');  % ��̬ѧ�ݶ���ȡ�ı߽� 

subplot 122
imshow(C-c_erode,[]);
title('Boundary');    % �򵥵ı߽���ȡ 

