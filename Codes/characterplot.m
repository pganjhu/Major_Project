
j=1;
k=1;
imagen=imresize(imagen,[256 256]);
%imagen = bwareaopen(imagen,30);
[L Ne]=bwlabel(imagen);
for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
    [m2 n2 ch]=size(n1);
    %if ((m2 < 250) && (n2 <250))
    n1=imresize(n1,[25 25]);
    out1{j}=~n1;
    
    subplot(5,5,j)
    imshow(~n1), %title('Detected Characters')
    hold on;
    j=j+1;
    pause(0.5)
    %end
    k=k+1;
end