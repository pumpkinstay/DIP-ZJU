function [DilateImg,ErodeImg]=DilateErode_BinaryImg(BinaryImg,SE)
% ���ܣ��Զ�ֵͼ��������ͺ͸�ʴ
% Input:   BinaryImg����������Ķ�ֵͼ��
%          SE����Structure Element �û��Զ���ĽṹԪ��
%
% Output:  DilateImg�������ͺ��ͼ��
%          ErodeImg ������ʴ���ͼ��
%

[M,N]=size(BinaryImg);
DilateImg=ones(M,N);
ErodeImg=zeros(M,N);


% ͼ��߽粹0
ExpandImg=zeros(M+2,N+2);   
ExpandImg(2:M+1,2:N+1)=BinaryImg; 



for m=2:M+1
    for n=2:N+1
        if((SE & ExpandImg(m-1:m+1,n-1:n+1))== zeros(3,3))  
            DilateImg(m-1,n-1)=0;       % if SE MISS, ��õ㲻���� ��0 
        else
            if ( (SE & ExpandImg(m-1:m+1,n-1:n+1))== SE)
            ErodeImg(m-1,n-1)=1;        % if SE FIT, ��ʴͼ�иõ㱣�� ��1
            end
        end
    end
end


end