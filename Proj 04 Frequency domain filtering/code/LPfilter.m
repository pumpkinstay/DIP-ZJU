% Ideal Lowpass Filter
% function: ÀíÏëµÍÍ¨ÂË²¨Æ÷
% Author: Wu Jiangnan 2019/4/5
% 


function [ Hd ] = LPfilter( input,r)

%  input  : image in 'double' data type , 2 dimensions
%  r : the radius of ideal filter;
%           range is [0,1] (  normalized )

                           % R of filter
[m,n] = size(input);     %Get the image size m*n
radius=max(m,n)*r;

Hd=zeros(m,n);   
     for i=1:m  
       for j=1:n  
        
           if sqrt((i-m/2)^2+(j-n/2)^2)<=radius  
             Hd(i,j)=1;   
          end  
      
     end  
 end  

end