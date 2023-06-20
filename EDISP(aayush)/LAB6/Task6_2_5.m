myImageRGB1 = imread('Lenna.png');
figure(1);
imhist(squeeze(myImageRGB1(:,:,1))); %1 channel
x=myImageRGB1(:,:,1);
%adjust x then assign it to the myimagergb1::1
figure(2);
imhist(myImageRGB1(:,:,2));