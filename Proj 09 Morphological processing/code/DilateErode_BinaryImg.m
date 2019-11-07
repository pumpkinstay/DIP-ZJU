function [DilateImg,ErodeImg]=DilateErode_BinaryImg(BinaryImg,SE)
% 功能：对二值图像进行膨胀和腐蚀
% Input:   BinaryImg——待处理的二值图像
%          SE——Structure Element 用户自定义的结构元素
%
% Output:  DilateImg——膨胀后的图像
%          ErodeImg ——腐蚀后的图像
%

[M,N]=size(BinaryImg);
DilateImg=ones(M,N);
ErodeImg=zeros(M,N);


% 图像边界补0
ExpandImg=zeros(M+2,N+2);   
ExpandImg(2:M+1,2:N+1)=BinaryImg; 



for m=2:M+1
    for n=2:N+1
        if((SE & ExpandImg(m-1:m+1,n-1:n+1))== zeros(3,3))  
            DilateImg(m-1,n-1)=0;       % if SE MISS, 则该点不膨胀 置0 
        else
            if ( (SE & ExpandImg(m-1:m+1,n-1:n+1))== SE)
            ErodeImg(m-1,n-1)=1;        % if SE FIT, 则腐蚀图中该点保留 置1
            end
        end
    end
end


end