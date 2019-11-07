% Gaussian Lowpass Filter
% 
% Author: Wu Jiangnan 2019/4/5
% 

function [ Hd ] = GaussLPF( input,D)

%  input  : image in 'double' data type , 2 dimensions
%  D : Gaussian end frequency 
%           range is [0,1] ( normalized )

                           % R of filter
                           
                           
[m,n] = size(input);     %Get the image size m*n
Hd=zeros(m,n);   


%Generate normalization uniformly-spaced point in frequency domain
for i= 1:m
    if mod(n,2)==0                             %n is even
        f1(i,:)=[-n+1:2:n-1]./(n-1);
        f2(:,i)=f1(i,:)';
    else                                       %n is odd
        f1(i,:)=[-n:2:n-2]./(n-1);
        f2(:,i)=f1(i,:)';
    end
end

r = f1.^2+f2.^2;                              %Filerting radius

for i =1:m
    for j = 1:n
        t=r(i,j)/(D*D);
        Hd(i,j)=exp(-t);
    end
end

end