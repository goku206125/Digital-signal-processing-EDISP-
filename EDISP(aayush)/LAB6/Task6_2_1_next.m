%student id 300389, table used is 9
M=24;%number of rows
N=64;%number of columns
MS=6;%size[px] of strip/square
%strips image
strip1=ones(MS,N);
strip0=zeros(MS,N);
img2=repmat([strip1;strip0],M/2/MS,1);
%we can calculate the mean value of the image and later multiply it by the
%size of the image to get that value of the yellow centered square in fft
MN=mean(img2(:));

figure(1);
imagesc(img2);
title('Initial Image');

IMG1=fft2(img2);
figure(2);
imagesc(fftshift(abs(IMG1)));
title('2D spectrum of the image');

%chequerboard
sqr1=ones(MS,MS);
sqr0=zeros(MS,MS);
img3=repmat([sqr1, sqr0; sqr0, sqr1],floor(M/2/MS),floor(N/2/MS));

figure(3);
imagesc(img3);
title('Initial Image');

IMG2=fft2(img3);
figure(4);
imagesc(fftshift(abs(IMG2)));
title('2D spectrum of the image');
%colors represent the frequencies


%IMAGE 
img4=Lenna;
myimageGray=rgb2gray(img4);
myimage=double(myimageGray);
figure(5);
imagesc(myimage);
colormap(gray);
colorbar;

IMG3=fft2(myimage);
figure(6);
imagesc(db(fftshift(abs(IMG3))));%using log scale to see precisely
title('2D spectrum of the image');
colormap(gray);
colorbar;
%colors represent the frequencies
