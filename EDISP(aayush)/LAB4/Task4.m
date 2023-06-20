%B = fir2(N,F,M,win); – N, F, M as in remez; win – chosen window (e.g bartlett(N+1))
%Implemented windows: blackman boxcar butter chebwin hamming hanning kaiser
%BOXCAR
F=[0 0.2 0.6 1];
M=[1 1 0 0];
N=50;
win=boxcar(N+1);

B = fir2(N,F,M,win); 
%impulse response
figure(1)
stem(B);
title('impulse response boxcar');

%frequency response
figure(2)
A=1;
N=1000;
freqz(B,A,N);
title('frequency response boxcar');

%HAMMING
F=[0 0.2 0.6 1];
M=[1 1 0 0];
N=50;
win1=hamming(N+1);

B = fir2(N,F,M,win1); 
%impulse response
figure(3)
stem(B);
title('impulse response hamming');

%frequency response
figure(4)
A=1;
N=1000;
freqz(B,A,N);
title('frequency response hamming');
