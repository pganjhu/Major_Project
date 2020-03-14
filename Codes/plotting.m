[L Ne]=bwlabel(fl);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off