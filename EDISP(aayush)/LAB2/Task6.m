clear all;

%rectangular window
w=rectwin(20);
mainlobebewidth=2/20;
W=abs(fftshift(fft(w, 128)));
figure(2);
plot((0:127)/128,20*log10(W))
grid on;
title('spectrum of rectwin, length 20');

%hamming window
%mainlobe width can be computed by similar formula
%smth like 2/20*(coeff) but i didn't find that coeff
%so just use points on the plot to compute it
w=hamming(20);
W=abs(fftshift(fft(w, 128)));
figure(3);
plot((0:127)/128,20*log10(W))
grid on;
title('spectrum of hamming, length 20');