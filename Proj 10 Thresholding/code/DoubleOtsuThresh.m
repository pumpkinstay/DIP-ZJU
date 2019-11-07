function [t1,t2]=DoubleOtsuThresh(img)
%
%  Otsu 双阈值求解
%  输入 图像img，输出 最优阈值t1和t2(归一化结果)
%
%


BinsNum = 256;  
hist = imhist(img,BinsNum);   
p = hist / sum(hist);          % 直方图的概率密度函数
mG= sum(p .* (1:BinsNum)');     % 全局均值

P1 = cumsum(p);                 % 概率分布
m1 = cumsum(p .* (1:BinsNum)')./P1; % 256*1  每个阈值的前景平均灰度

% 根据算法理论，从k2+1累加到L-1，so 先倒着累加再翻转回来
P3= cumsum(flip(p));          
m3 = cumsum(flip(p) .* flip(1:BinsNum)')./P3;
P3=flip(P3);
P3=[P3(2:end) ;0];             %P3的索引用k2，则P3(1)实际上是从p(2)加到p(256)，所以要移动一个
                               %移动后也用不到P3(1)这个值，因为k2>k1>1
m3=flip(m3);
m3=[m3(2:end) ;0];

% m2 P2为 k1*k2的索引矩阵，为 256*256 的上三角矩阵 因为k1<k2
m2=zeros(BinsNum,BinsNum);    
P2=zeros(BinsNum,BinsNum);


for k1=1:BinsNum-2
    for k2=k1+1:BinsNum-1
        P2(k1,k2)=1-P1(k1)-P3(k2);
        m2(k1,k2) = sum( (k1+1:k2)' .* p(k1+1:k2) )./ P2(k1,k2) ;        
    end
end


% 遍历k1,k2各种组合  求方差
variance=zeros(BinsNum,BinsNum);
for k1=1:BinsNum-2
    for k2=k1+1:BinsNum-1
        
    % variance 为256*256 的上三角矩阵 因为l1<k2
    variance(k1,k2) = P1(k1)*(m1(k1)-mG)^2 + ...
                      P2(k1,k2)*(m2(k1,k2)-mG)^2 + ...
                      P3(k2)*(m3(k2)-mG)^2;
   
    end
end

% 最大方差点即为最优阈值
[~,index] = max(variance(:));
[index_row,index_col] = ind2sub(size(variance),index);

%灰度值为[0,255] 因此需要-1
t1= (index_row-1)./(BinsNum-1);
t2= (index_col-1)./(BinsNum-1);

end