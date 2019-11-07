function t=otsuThresh(img)
%
% Otsu ������ֵ���
%  ���� ͼ��img����� ������ֵt
%

BinsNum = 256;   % ֱ��ͼ��Χ
hist = imhist(img,BinsNum);   % ֱ��ͼͳ��

p = hist / sum(hist);          % �Ҷȷֲ��ĸ����ܶȺ���
Pk = cumsum(p);             % ���ʷֲ�
mk = cumsum(p .* (1:BinsNum)'); % 256*1  ÿ����ֵ��ǰ��ƽ���Ҷ�
mG = mk(end);                 

% ����[1,256] ���㷽��
variance = (mG * Pk - mk).^2 ./ (Pk .* (1 - Pk)); 

% ��󷽲�㼴Ϊ������ֵ
[maxVariance,index] = max(variance);

if length(index)~=1
    index=mean(index);   % ����ж����󷽲�� ���ֵ

end
 t= (index-1)/(BinsNum-1);

end
