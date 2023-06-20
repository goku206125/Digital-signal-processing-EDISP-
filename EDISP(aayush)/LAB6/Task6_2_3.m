img4=bariera;
myimageGray=rgb2gray(img4);
myimage=double(myimageGray);
figure(5);
imagesc(myimage);
colormap(gray);
colorbar;

%Highpass filter 3
hp3=[ 1, -2, 1;...
-2, 5, -2;...
1, -2, 1];
y=filter2(hp3,myimage);

%Edge filter 2
edg2=[-1, 0, 0;...
0, 1, 0;...
0, 0, 0];
y=filter2(edg2,y);
figure(10);
imagesc(y);
colormap(gray);
colorbar;
title('Edge filter');
figure(13);
hist(y(:),512);
%lp1=[ 1, 1, 1;...
%1, 1, 1;...
%1, 1, 1];
%y=filter2(lp1,y);


threshold=15;
BW=boolean(abs(y)>threshold);

[H,T,R] = hough(BW,'RhoResolution',0.5,'Theta',-90:0.5:89.5);
P = houghpeaks(H,9,'threshold',ceil(0.3*max(H(:))));
% The coefficient 0.3 above may be changed
%to get better results
L = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure(2)
plot_hough(H,T,R);
figure(3)
imshow(BW);
hold on
plot_lines(L);
hold off
