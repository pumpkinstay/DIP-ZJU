function Out=complement(Img)
% 
% function���ԻҶ�ͼ�� �󲹼� �Ҷȷ�ΧΪ[0,1]
%


    [M,N]=size(Img);
   
    Out=ones(M,N)-Img;

end