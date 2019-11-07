% Name: MedianFilter
%
% Author: Wu Jiangnan   2019/3/25
% 

function  out=MedianFilter(img,N)

% N:  max filtering Radius(Nmax must be odd)
%
%


[m,n]=size(img);

imgn=zeros(m+2*N+1,n+2*N+1);
imgn(N+1:m+N,N+1:n+N)=img;

imgn(1:N,N+1:n+N)=img(1:N,1:n);                                  %Upper Expansion
imgn(1:m+N,n+N+1:n+2*N+1)=imgn(1:m+N,n:n+N);                     %Right Expansion
imgn(m+N+1:m+2*N+1,N+1:n+2*N+1)=imgn(m:m+N,N+1:n+2*N+1);         %Lower Expansion
imgn(1:m+2*N+1,1:N)=imgn(1:m+2*N+1,N+1:2*N);                     %Left Expansion


[height, ~]=size(imgn);                             %Size of Expansived Image
x1=double(imgn);
x2=x1;
for i=1:height-N+1
    for j=1:height-N+1
        c=x1(i:i+(N-1),j:j+(N-1));                %get the initial filtering point
        e=c(1,:);                                       %first row of matrix 'c'
        for u=2:N
            e=[e,c(u,:)];                               %make 'c' a row vector 'e'   
        end
        n1=N*N;                                   %Number of pixel in model
        for l=1:n1-1                                    %Sort the row vector
            for q=1:n1-1
                if e(q)>e(q+1)
                    c1 = e(q);
                    e(q) = e(q+1);
                    e(q+1) = c1;
                end
            end
         end
        mm = e((n1+1)/2);                               %mm is the median number
        x2(i+(N-1)/2,j+(N-1)/2)=mm;               %assignment median value for the center point
    end
end 
%keep the unassignment points
out=uint8(x2);

end