function Out=intersection(ImgA,ImgB)
% 
% function：对两幅一样大小的灰度图像A,B进行交运算  
%

% 两幅图尺寸需一样
if size(ImgA)~=size(ImgB)
    disp('The size of these two images do not match'); 
    Out=0
else 

    [M,N]=size(ImgA);
    Out=zeros(M,N);
    for m=1:M
        for n=1:N
            Out(m,n)=min(ImgA(m,n),ImgB(m,n));    % 小于0的像素点 MATLAB会以0显示，即黑色
        end
    end
end
end