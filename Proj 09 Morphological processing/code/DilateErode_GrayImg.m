function [DilateImg,ErodeImg]=DilateErode_GrayImg(GrayImg,SE)
% 功能：对灰度图像进行膨胀和腐蚀
% Input:   GrayImg——待处理的灰度图像
%          SE——Structure Element 用户自定义的结构元素
%
% Output:  DilateImg——膨胀后的图像
%          ErodeImg ——腐蚀后的图像
%

[M,N]=size(GrayImg);
DilateImg=zeros(M,N);
ErodeImg=zeros(M,N);

% 图像边界补0
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