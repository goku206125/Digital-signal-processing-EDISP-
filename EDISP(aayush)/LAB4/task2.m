x1=0.9*exp(j*0.8*pi);
x2=0.9*exp(-j*0.8*pi);
Roots = [x1,x2];
A=poly(Roots);
B=1;

dlt=zeros(1,64); 
dlt(1)=1;
X=dlt;
Y=filter(B, A, X);

%impulse response plot
figure(1)
plot(Y);
title('impulse response plot');

%frequency response
N=1000;
figure(2)
freqz(B,A,N);
title('frequency response');

%group delay
figure(3)
grpdelay(B,A);
title('group delay');
