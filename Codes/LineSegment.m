

% Read image
i=imgetfile();
input=imread(i);
figure, imshow(input), title('Original Image');

% Deskew a document
[ im, theta ] = imdeskew( input );
figure, imshow(im), title('Deskewed image');

if size(im,3)==3 % RGB image %% Convert to gray scale
    im=rgb2gray(im);
end

%threshold = graythresh(im); %% Convert to binary image
%im =~im2bw(im,threshold);
%im = medfilt2(im, [3 3]);
im = bwareaopen(im,60); %% Remove all object containing fewer than 60 pixels
                     %converting image to black and white
%I3 = bwmorph(~im, 'thin', inf); 
%figure %% Show image binary image
%imshow(im);
%title('INPUT IMAGE WITHOUT NOISE')

%find Area of Interest:
a=(im);
ijk=~a;
L=sum(ijk,2);
L=0;
measurements = regionprops(L, 'PixelIdxList','Area','BoundingBox');
% Get indexes of those regions that are >= 20 in length.
fiveLongRegions = find([measurements.Area] >= 5);
theIndexes = vertcat(measurements(fiveLongRegions).PixelIdxList);
c=a;
c(theIndexes,:)=0;
figure, imshow(c);
title('AREA OF INTEREST FOR LINE SEGMENT');

%Segmentation of line:
[x,y]=size(c);
mat1=sum(c,2);%sum the elements of bwrowise and save into column matrix mat1
mat2=y-mat1;%subtract each element of the sum matrix(mat1) from the width length(no. of columns)
mat3=mat2~=0;
mat4=diff(mat3);
index1=find(mat4);
[q,w]=size(index1);%size of index2 matrix is q*w
kap=1;
lam=1;
%iii=1;
%ii=1;
while kap<((q/2)+1);%number of loops=number of lines
    k=1;
    mat5=([]);
       for j=(index1(lam)+1):1:index1(lam+1)
         mat5(k,:)=a(j,:); %store the line segmented matrix
           k=k+1;
       end

              lam=lam+2;   
          kap=kap+1;

         figure, imshow(mat5);
         %imsave();

         %%WORDS SEGMENTATION:

          bwword=im2bw(mat5);%convert the image im into binary(black and white)
          aword=~bwword;

          bword=sum(aword,1);
          figure, imshow(aword);

          %%Measure lengths of all "0" regions.
          measurementsword = regionprops(bword, 'Area', 'PixelIdxList');

          % Get indexes of those regions that are >= 20 in length.
        fiveLongRegionsword = find([measurementsword.Area] >= 5);
          theIndexesword = vertcat(measurementsword(fiveLongRegionsword).PixelIdxList);
          cword=aword;
         cword(:,theIndexesword)=1;
         %figure, imshow(c);

          dword=~cword;
          %figure, imshow(dword);
          %title('AREA OF INTERESRT FOR WORD SEGMENTATION IMAGE');

          [xword,yword]=size(cword);
          mat1word=sum(cword,1);%sum the elements of bwrowise and save into column matrix mat1
          mat2word=xword-mat1word;%subtract each element of the sum matrix(mat1) from the width length(no. of columns)
          mat3word=mat2word~=0;
          mat4word=diff(mat3word);
          index1word=find(mat4word);
          [qword,wword]=size(index1word);%size of index2 matrix is q*w
        kapword=1;
          lamword=1;
          %%iii=1;
          %%ii=1;

           while kapword<((wword/2)+1);%number of loops=number of lines
      kword=1;
     mat5word=([]);
         for jword=(index1word(lamword)+1):1:index1word(lamword+1)
          mat5word(:,kword)=bwword(:,jword); %store the word segmented matrix
            kword=kword+1;
        end

             lamword=lamword+1;   
         kapword=kapword+1;

         figure, imshow(mat5word);
           end 

end

%deskew

