function level =BasicGlobalThreshold(img)
%
% function : ��global thresholding
%
%


img = im2double(img);          
[M,N] = size(img);
T0 = 0.001;                %�������� 
T1 = mean(img(:));       % ��ʼ��ֵT1 ,ѡΪͼ��ҶȾ�ֵ
 %����G1��G2���±꣬ͬʱ��ͳ�Ƹ���������
 
columns1 = 1; 
columns2 = 1;
 %��ʼ����
 
while 1 
    for m = 1:M
         for n = 1:N 
            if img(m,n)>T1 
                G1(columns1) = img(m,n);           %�õ�����G1
                 columns1 = columns1 + 1;
             else
                 G2(columns2) = img(m,n);          %�õ�����G2
                 columns2 = columns2 + 1;
             end
         end
     end

        %����G1��G2��ֵ
     u1 = mean(G1);
     u2 = mean(G2);
     T2 = (u1 + u2)/2;           %�õ�����ֵT2
     if abs(T2 - T1)<T0          %�ж�T2�Ƿ���������
         break;
     end
     T1 = T2;
     columns1 = 1;
     columns2 = 1;
end
 

 level = T2;
end
  