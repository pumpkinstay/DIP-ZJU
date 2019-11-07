function [t1,t2]=DoubleOtsuThresh(img)
%
%  Otsu ˫��ֵ���
%  ���� ͼ��img����� ������ֵt1��t2(��һ�����)
%
%


BinsNum = 256;  
hist = imhist(img,BinsNum);   
p = hist / sum(hist);          % ֱ��ͼ�ĸ����ܶȺ���
mG= sum(p .* (1:BinsNum)');     % ȫ�־�ֵ

P1 = cumsum(p);                 % ���ʷֲ�
m1 = cumsum(p .* (1:BinsNum)')./P1; % 256*1  ÿ����ֵ��ǰ��ƽ���Ҷ�

% �����㷨���ۣ���k2+1�ۼӵ�L-1��so �ȵ����ۼ��ٷ�ת����
P3= cumsum(flip(p));          
m3 = cumsum(flip(p) .* flip(1:BinsNum)')./P3;
P3=flip(P3);
P3=[P3(2:end) ;0];             %P3��������k2����P3(1)ʵ�����Ǵ�p(2)�ӵ�p(256)������Ҫ�ƶ�һ��
                               %�ƶ���Ҳ�ò���P3(1)���ֵ����Ϊk2>k1>1
m3=flip(m3);
m3=[m3(2:end) ;0];

% m2 P2Ϊ k1*k2����������Ϊ 256*256 �������Ǿ��� ��Ϊk1<k2
m2=zeros(BinsNum,BinsNum);    
P2=zeros(BinsNum,BinsNum);


for k1=1:BinsNum-2
    for k2=k1+1:BinsNum-1
        P2(k1,k2)=1-P1(k1)-P3(k2);
        m2(k1,k2) = sum( (k1+1:k2)' .* p(k1+1:k2) )./ P2(k1,k2) ;        
    end
end


% ����k1,k2�������  �󷽲�
variance=zeros(BinsNum,BinsNum);
for k1=1:BinsNum-2
    for k2=k1+1:BinsNum-1
        
    % variance Ϊ256*256 �������Ǿ��� ��Ϊl1<k2
    variance(k1,k2) = P1(k1)*(m1(k1)-mG)^2 + ...
                      P2(k1,k2)*(m2(k1,k2)-mG)^2 + ...
                      P3(k2)*(m3(k2)-mG)^2;
   
    end
end

% ��󷽲�㼴Ϊ������ֵ
[~,index] = max(variance(:));
[index_row,index_col] = ind2sub(size(variance),index);

%�Ҷ�ֵΪ[0,255] �����Ҫ-1
t1= (index_row-1)./(BinsNum-1);
t2= (index_col-1)./(BinsNum-1);

end