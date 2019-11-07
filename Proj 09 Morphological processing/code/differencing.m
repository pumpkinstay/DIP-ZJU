function DiffImg=differencing(ImgA,ImgB)
% 
% function：对两幅一样大小的灰度图像A,B进行差运算  out=A-B
%

% 两幅图尺寸需一样
if size(ImgA)~=size(ImgB)
    disp('ERROR: the size of these two images do not match'); 
    DiffImg=0
else 

    DiffImg=ImgA-ImgB;    % 小于0的像素点 MATLAB以0显示，即黑色
    
end
end

