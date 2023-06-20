myImageRGB = imread('Lenna.png');
myImageGray= rgb2gray(myImageRGB);
Image = double(myImageGray);
NoisyImage=double(imnoise(uint8(Image),'salt & pepper',0.2));
figure(1);
imagesc(NoisyImage);
colormap(gray);
colorbar;
title('Image with the noise');
%applying lp filter
lp4=[ 1, 1, 2, 1, 1;...
1, 2, 4, 2, 1;...
2, 4, 8, 4, 2;...
1, 2, 4, 2, 1;...
1, 1, 2, 1, 1];
new=filter2(lp4,NoisyImage);
figure(2);
imagesc(new);
colormap(gray);
colorbar;
title('Filtered with lowpass');

%applying median filter
new2=medfilt2(NoisyImage);
figure(3);
colormap(gray);
colorbar;
imagesc(new2);