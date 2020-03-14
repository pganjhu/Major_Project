clear all;close all;clc
delete templates;
for i = 1:15
    imgname = strcat('Kannada_Alphabet/vowels/',num2str(i),'.jpg');
    I=imread(imgname);
    character{i}=logical(imresize(I(:,:,1),[42,24])/255);
    figure(1),imshow(character{i},[]);
end
j=15;
for i = 1:34
       
%     if i==18
%         j=j-1;
%     else
          %j=i+j;
         k=j-2;
          j = j+1;
    imgname = strcat('Kannada_Alphabet/consonants/',num2str(k),'.jpg');
    I=imread(imgname);
    character{j}=logical(imresize(I(:,:,1),[42,24])/255);
    figure(1),imshow(character{j},[]);
    pause(0.5)
    %end
end
% j=49;
% for i = 1:10
%     j=j+1;
%     k=i+50;
%     imgname = strcat('Kannada_Alphabet/numbers/',num2str(k),'.jpg');
%     I=imread(imgname);
%     character{j}=logical(imresize(I(:,:,1),[42,24])/255);
%     figure(1),imshow(character{j},[]);
%     pause(0.5)
% end
templates =character;

save ('templates','templates')
clear all