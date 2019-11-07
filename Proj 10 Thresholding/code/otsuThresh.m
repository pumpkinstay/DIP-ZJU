function t=otsuThresh(img)
%
% Otsu 最优阈值求解
%  输入 图像img，输出 最优阈值t
%

BinsNum = 256;   % 直方图范围
hist = imhist(img,BinsNum);   % 直方图统计

p = hist / sum(hist);          % 灰度分布的概率密度函数
Pk = cumsum(p);             % 概率分布
mk = cumsum(p .* (1:BinsNum)'); % 256*1  每个阈值的前景平均灰度
mG = mk(end);                 

% 遍历[1,256] 计算方差
variance = (mG * Pk - mk).^2 ./ (Pk .* (1 - Pk)); 

% 最大方差点即为最优阈值
[maxVariance,index] = max(variance);

if length(index)~=1
    index=mean(index);   % 如果有多个最大方差点 求均值

end
 t= (index-1)/(BinsNum-1);

end
