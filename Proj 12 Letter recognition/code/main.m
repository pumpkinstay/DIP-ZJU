clc;
clear all;

imagen = imread('fox.JPG');

pause(0.5)
%%%%%%%%%%%%%%%
%% Image segmentation and extraction
%% Show image
figure(1)
imshow(imagen);
title('INPUT IMAGE WITH NOISE')
pause(0.5)

%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);

%% Remove all objects containing fewer than 30 pixels, 15 here...
imagen =bwareaopen(imagen,15);  
pause(1)
%% Show image binary image
figure(2)
imshow(imagen);
title('INPUT IMAGE WITHOUT NOISE')
%% Edge detection
Iedge = edge(uint8(imagen));
imshow(~Iedge)
%% Morphology
% * *Image Dilation*
se = strel('square',3);
Iedge2 = imdilate(Iedge, se); 
figure(3)
imshow(~Iedge2);
title('IMAGE DILATION')
% * *Image Filling*
Ifill= imfill(Iedge2,'holes');
figure(4)
imshow(~Ifill)
title('IMAGE FILLING')
Ifill=Ifill & imagen;
figure(5)
imshow(~Ifill);

re=Ifill;


while 1
    % 分割text(可能为多行)为line(一行) ，
    [fl re]=lines(re);
    imgn=fl;
    
    % 给分割元素加标签、计算元素素量
    [L Ne] = bwlabel(imgn);    
    

for n=1:Ne
    [r,c] = find(L==n);
    n1=imgn(min(r):max(r),min(c):max(c));
   %imshow(~n1);
   %bwmorph : With n = Inf, thins objects to lines. It removes pixels so that an object without holes shrinks to a minimally connected stroke, 
   %and an object with holes shrinks to a connected ring halfway between each hole and the outer boundary. This option preserves the Euler number.
    BW2 = bwmorph(n1,'thin',Inf);
    imrotate(BW2,0);
    imshow(~BW2);
    z=imresize(BW2,[50 50]);
    %%contents = get(handles.popupmenu5,'String'); 
    %%popupmenu5value = contents{get(handles.popupmenu5,'Value')};
    %%switch popupmenu5value
      %%case 'Train using Gradient Technique'
        z=feature_extract(z);
      %%case 'Train using Geometric Feature Extraction'
        %%z=feature_extractor(z);
   %%end
    %mkc%%load ('D:\training_set\featureout.mat');
    
    load('featureout.mat');
    featureout=z;
    %disp(z);
    %mkc%%save ('D:\training_set\featureout.mat','featureout');
    save('featureout.mat','featureout');
    testit
    
    pause(0.5);
end
if isempty(re)  %See variable 're' in Fcn 'lines'
        break
    end    
end
clear all
%mkc%%winopen('D:\training_set\output.txt');
winopen('output.txt');
