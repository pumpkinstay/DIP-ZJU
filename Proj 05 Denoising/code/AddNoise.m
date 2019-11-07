
clear all;clc;  


img=imread('match.tif');
[width,height,z]=size(img);
if(z>1)
    img=rgb2gray(img);
end


%% �Ӹ�˹


av=0;       % �ɸı��ع��
A=0.2;   % ��˹��������
u1=rand(width,height);
u2=rand(width,height);
x=A*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
result1=double(img)/255+x;
result1=uint8(255*result1);

figure(2);
subplot(1,2,1);
imshow(img);
title('ԭͼ');
subplot(1,2,2);
imshow(result1);
title('�Ӹ�˹������');
%% �ӽ�������

result2=img;

p=0.1;         % ����
WhiteBlack=0.3;  % �׺������� WhiteBlack=0.5��һ���һ���
a1=rand(width,height)<p;
a2=rand(width,height)<WhiteBlack;
result2(a1&a2)=0;
result2(a1& ~a2)=255;

figure(2);
subplot(1,2,1);
imshow(img);
title('ԭͼ');
subplot(1,2,2);
imshow(result2);
title('�ӽ���������');



