function LCPS_plot(x)
%
%	c2_plot(x)
%	
%	Procedura wyswietla widmo amplitudowe sygnalu x
%
X = 20*log10(abs(fftshift(fft(x))));
l=length(X);
f=((0:l-1)-l/2)/l;
plot(f,max(X,-40))
title('Amplitude Window');
xlabel('Normalized frequency')
ylabel('Amplitude [dB]')
grid

