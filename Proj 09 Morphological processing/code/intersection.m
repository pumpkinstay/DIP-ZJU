function Out=intersection(ImgA,ImgB)
% 
% function��������һ����С�ĻҶ�ͼ��A,B���н�����  
%

% ����ͼ�ߴ���һ��
if size(ImgA)~=size(ImgB)
    disp('The size of these two images do not match'); 
    Out=0
else 

    [M,N]=size(ImgA);
    Out=zeros(M,N);
    for m=1:M
        for n=1:N
            Out(m,n)=min(ImgA(m,n),ImgB(m,n));    % С��0�����ص� MATLAB����0��ʾ������ɫ
        end
    end
end
end