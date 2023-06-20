img1=ones(32,16);
figure(1);
colormap('gray');
imagesc(img1);
title('Initial Image');

IMG1=fft2(img1);
figure(2);
imagesc(fftshift(abs(IMG1)));
title('2D spectrum of the image');
%the initial yellow square is 32*16=512, which is the intial frquency
%displayed (zero frequency), but we have only the const component.
%with the ffftshift the yellow square is in the middle