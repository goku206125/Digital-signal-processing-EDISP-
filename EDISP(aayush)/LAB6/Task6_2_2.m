%300398 table index is 9
lp1=[ 1, 1, 1;...
1, 1, 1;...
1, 1, 1];

img4=Lenna;
myimageGray=rgb2gray(img4);
myimage=double(myimageGray);
figure(5);
imagesc(myimage);
colormap(gray);
colorbar;

%Lowpass filter 1
y=filter2(lp1,myimage);
figure(6);
imagesc(y);
colormap(gray);
colorbar;
title('Lowpass filter');

%frequency response
y=freqz2(lp1);
figure(7);
imagesc(y);
colormap(gray);
colorbar;
title('Lowpass filter frequency response');

%Highpass filter 3
hp3=[ 1, -2, 1;...
-2, 5, -2;...
1, -2, 1];
y=filter2(hp3,myimage);
figure(8);
imagesc(y);
colormap(gray);
colorbar;
title('Highpass filter');

%frequency response
y=freqz2(hp3);
figure(9)
imagesc(y);
colormap(gray);
colorbar;
title('Highpass filter frequency response');

%Edge filter 2
edg2=[-1, 0, 0;...
0, 1, 0;...
0, 0, 0];
y=filter2(edg2,myimage);
figure(10);
imagesc(y);
colormap(gray);
colorbar;
title('Edge filter');


%frequency response
y=freqz2(edg2)
figure(11);
imagesc(abs(y));
colormap(gray);
colorbar;
title('Edge filter frequency response');


%spectrum before filtering
IMG2=fft2(myimage);
figure(12);
imagesc(fftshift(abs(IMG2)));
title('2D spectrum of the image');

