function Out=complement(Img)
% 
% function：对灰度图像 求补集 灰度范围为[0,1]
%


    [M,N]=size(Img);
   
    Out=ones(M,N)-Img;

end