
% ����˵���� ������
%   ���� basic global threshold��otsu threshold��otsu double threshold
%   
%

 clc;clear;close all;

 
 %% ����ͼA
  imgA =imread('Fig1039(a)(polymersomes).tif');
 % ��ֵ����
 BasicT =BasicGlobalThreshold(imgA);        
 J1 = imbinarize(imgA,BasicT);                    %ͼ���ֵ��
 otsuT =otsuThresh(imgA);                   
 J2 = imbinarize(imgA,otsuT);                    %ͼ���ֵ��

% close all
 figure 
 subplot 121
 imshow(imgA);title('ԭͼ��');
 subplot 122
 imhist(imgA)
 figure
 subplot 121
 imshow(J1);title('global threshold');
 subplot 122
 imshow(J2);title('otsu threshold');
 
  %% ����ͼB

  
 imgB =imread('window.jpg');
 imgB=rgb2gray(imgB);
 imgB=im2double(imgB);
  
 
 BasicT2 =BasicGlobalThreshold(imgB);        
 J3 = imbinarize(imgB,BasicT2);                    %ͼ���ֵ��
 otsuT2 =otsuThresh(imgB);                   
 J4 = imbinarize(imgB,otsuT2);                    %ͼ���ֵ��
 
 figure 
  subplot 121
 imshow(imgB);title('ԭͼ��');
 subplot 122
 imhist(imgB)
 figure
 subplot 121
 imshow(J3);title('global threshold');
 subplot 122
 imshow(J4);title('otsu threshold');
 
 %% ��ƽ��ͼB��ȡ��ֵЧ�� ȥ��Ƶ
%  close all
 gaussH=fspecial('gaussian',[5 5],10);
 smoothB=imfilter(imgB,gaussH);
 
%  smoothB=wiener2(imgB);

 BasicT2 =BasicGlobalThreshold(smoothB);        
 J5 = imbinarize(smoothB,BasicT2);                    %ͼ���ֵ��
 otsuT2 =otsuThresh(smoothB);                   
 J6 = imbinarize(smoothB,otsuT2);                    %ͼ���ֵ��

  figure 
  subplot 121
 imshow(smoothB);title('ƽ���˲���');
 subplot 122
 imhist(smoothB)
 figure
 subplot 121
 imshow(J5);title('global threshold');
 subplot 122
 imshow(J6);title('otsu threshold');
 
 %% ˫��ֵ ���������Ӳ��Դ�����ȷ��
 
 imgC=imread('iceberg.tif');  % ���������ӵ�ͼƬ����,��֤�㷨��ȷ���
 

 [t1,t2] =DoubleOtsuThresh(imgC); 
 T1=t1*255;
 T2=t2*255;
J7=img2gray(imgC,T1,T2);
 figure
 subplot 121
 imshow(imgC);title('ԭͼC');
 subplot 122
 imshow(J7,[]);title('˫��ֵ');
 disp(['     otsu˫��ֵΪ��   ' ,'t1=',num2str(T1),'     t2=',num2str(T2)])
 
 % ��������ϵ�һ��
 
  %% ˫��ֵ ���Լ�������ͼƬ����
%  close all
  % ���� ͼB ���� %
 [t1B,t2B] =DoubleOtsuThresh(smoothB);    

% �����unit8���� Ҫ��255��[0,1]��double���Ͳ���
%  T1B=t1B*255;   
%  T2B=t2B*255;

 T1B=t1B;  
 T2B=t2B;
 

J9=img2gray(smoothB,T1B,T2B);

  figure 
 imshow(J9,[]);title('ƽ��+˫��ֵ�ָ�');
 
%%
 % ���� ͼD ���� %


  imgD=imread('ladder.jpg');
%   imgD=rgb2gray(imgD);
 [t1D,t2D] =DoubleOtsuThresh(imgD);    

 T1D=t1D*255;
 T2D=t2D*255;
  % ��Ϊ 0 127 255 ��ʾ
  
J8=img2gray(imgD,T1D,T2D);

 
 figure 
 subplot 121
 imshow(imgD);title('ԭͼD');

subplot 122
 imshow(J8,[]);title('˫��ֵ�ָ�');
 
 %% ��ɫͼE


  imgE=imread('piano.jpg');
  imgE=rgb2gray(imgE);
 [t1E,t2E] =DoubleOtsuThresh(imgE);    

 T1E=t1E*255;
 T2E=t2E*255;

   % ��Ϊ 0 127 255 ��ʾ
  
J10=img2gray(imgE,T1E,T2E);

 figure 
 subplot 121
 imshow(imgE);title('ԭͼE');

 subplot 122
 imshow(J10,[]);title('˫��ֵ�ָ�');
 