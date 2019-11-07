function out=img2gray(img,t1,t2)
 [M,N]=size(img);
 out=zeros(M,N);
  
 for m=1:M
     for n=1:N
         if img(m,n)<t1
             out(m,n)=0;
         else
             if( img(m,n)>t1 && img(m,n)<t2)
                 out(m,n)=127;
             else
                out(m,n)=255;
             end
         end
     end
 end
end
