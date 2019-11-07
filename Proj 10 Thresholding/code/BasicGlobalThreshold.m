function level =BasicGlobalThreshold(img)
%
% function : 求global thresholding
%
%


img = im2double(img);          
[M,N] = size(img);
T0 = 0.001;                %设置门限 
T1 = mean(img(:));       % 初始阈值T1 ,选为图像灰度均值
 %定义G1、G2的下标，同时起统计个数的作用
 
columns1 = 1; 
columns2 = 1;
 %开始遍历
 
while 1 
    for m = 1:M
         for n = 1:N 
            if img(m,n)>T1 
                G1(columns1) = img(m,n);           %得到分组G1
                 columns1 = columns1 + 1;
             else
                 G2(columns2) = img(m,n);          %得到分组G2
                 columns2 = columns2 + 1;
             end
         end
     end

        %计算G1、G2均值
     u1 = mean(G1);
     u2 = mean(G2);
     T2 = (u1 + u2)/2;           %得到新阈值T2
     if abs(T2 - T1)<T0          %判断T2是否满足条件
         break;
     end
     T1 = T2;
     columns1 = 1;
     columns2 = 1;
end
 

 level = T2;
end
  