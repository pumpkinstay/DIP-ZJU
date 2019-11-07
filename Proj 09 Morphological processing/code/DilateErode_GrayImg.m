function [DilateImg,ErodeImg]=DilateErode_GrayImg(GrayImg,SE)
% ���ܣ��ԻҶ�ͼ��������ͺ͸�ʴ
% Input:   GrayImg����������ĻҶ�ͼ��
%          SE����Structure Element �û��Զ���ĽṹԪ��
%
% Output:  DilateImg�������ͺ��ͼ��
%          ErodeImg ������ʴ���ͼ��
%

[M,N]=size(GrayImg);
DilateImg=zeros(M,N);
ErodeImg=zeros(M,N);

% ͼ��߽粹0
ExpandImg=zeros(M+2,N+2);   
ExpandImg(2:M+1,2:N+1)=GrayImg; 



for m=2:M+1
    for n=2:N+1
       dilate=ExpandImg(m-1:m+1,n-1:n+1)+SE;
       DilateImg(m-1,n-1)=max(dilate(:));
       erode=ExpandImg(m-1:m+1,n-1:n+1)-SE;
       ErodeImg(m-1,n-1)=min(erode(:));
    end
end



end