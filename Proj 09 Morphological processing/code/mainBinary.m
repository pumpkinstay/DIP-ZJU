%%  ��ʼ��
clc;clear close all
A=imread('leaf.tif');
ABinary=logical(A);  % ��֤���Ƕ�ֵͼ


B=imread('wirebond.tif');
B=double(B);



%% ��ֵͼ�� ��ʴ����


SE1=ones(3,3);
[A_dilate,A_erode]=DilateErode_BinaryImg(ABinary,SE1);

for k=1:2
    % ������ͼ ֻ����һ�ε�Ч�������ԣ��ظ���������
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

%% ��ֵ�Ľ� �� �� 

% ���� Binary ���� %
ImgB=B;
ImgA=imresize(double(A),size(ImgB));  % ѹ��ͼA����֤��ͼ��Сһ��

diff=differencing(ImgA,ImgB);  % ���
intersec=intersection(ImgA,ImgB);  % ��
imple=complement(ImgB);  % ��

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

%% �߽���ȡ
% �߽���ȡ = A- erode(A)
ABoundary=differencing(A,A_erode);
figure
imshow(ABoundary);
title('Boundary Extraction');



