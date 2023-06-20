
F=[0 0.2 0.6 1];
M=[1 1 0 0];
N=50;

B = firpm(N,F,M); 
%impulse response
figure(1)
stem(B);
title('impulse response');

%frequency response
figure(2)
A=1;
N=1000;
freqz(B,A,N);
title('frequency response');


%narrower transition
F=[0 0.2 0.4 1];
M=[1 1 0 0];
N=50;


B = firpm(N,F,M); 
%impulse response
figure(3)
stem(B);
title('impulse response narrower band');

%frequency response
figure(4)
A=1;
N=1000;
freqz(B,A,N);
title('frequency response narrower band');