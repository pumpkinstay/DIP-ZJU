function DiffImg=differencing(ImgA,ImgB)
% 
% function��������һ����С�ĻҶ�ͼ��A,B���в�����  out=A-B
%

% ����ͼ�ߴ���һ��
if size(ImgA)~=size(ImgB)
    disp('ERROR: the size of these two images do not match'); 
    DiffImg=0
else 

    DiffImg=ImgA-ImgB;    % С��0�����ص� MATLAB��0��ʾ������ɫ
    
end
end

