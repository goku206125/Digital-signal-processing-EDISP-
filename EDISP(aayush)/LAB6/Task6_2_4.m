image=Lenna;
NoisyImage=double(imnoise(im2double(image),'salt & pepper',0.2));
figure(1);
imagesc(NoisyImage);
title('Image with the noise');

%applying lp filter
lp4=[ 1, 1, 2, 1, 1;...
1, 2, 4, 2, 1;...
2, 4, 8, 4, 2;...
1, 2, 4, 2, 1;...
1, 1, 2, 1, 1];

y=filter2(lp4,NoisyImage);
figure(2);
imagesc(y);
title('Filtered with lowpass');