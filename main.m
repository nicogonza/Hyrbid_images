close all; 
im1= rgb2gray(imread('./images/cat.bmp'));
im2= rgb2gray(imread('./images/hitler.jpg'));
[im1,im2]=align_images(im1,im2);
%use low-pass filter to create blurry image. This will be the image seen
%from a distance
 
c= cell(3,9);
temp= im1;
temp2=im2;
n=6;


for i=1: n
    if i ~= 1
        temp = imresize(c{1,i-1}, .5);
        temp = imgaussfilt(temp,1);
        c{1,i}=temp;
        c{2,i-1}=c{1,i-1}-imresize(c{1,i},size(c{1,i-1}));
        temp2 = imresize(c{3,i-1}, .5);
        temp2 = imgaussfilt(temp2,1);
        c{3,i}=temp2;
        c{4,i-1}=c{3,i-1}-imresize(c{3,i},size(c{3,i-1}));
    else
        c{1,i}=temp;
        c{2,i}=temp;
        c{3,i}=temp2;
        c{4,i}=temp2;
    end
    
end
index=1;
for i = 1: 4
    for j = 1: n
        if(i==2 || i==4)&& j<n
          t= imadjust(c{i,j});
        subplot(4,n,index) , imshow(t);
        else
            subplot(4,n,index) , imshow(c{i,j});
        end
        index = index +1;
    end
        
end


low= 4;
high = 2;

output= build_hybrid(im1,n,c,low,high);

figure, imshow(output);