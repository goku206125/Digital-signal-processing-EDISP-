x1=0.9*exp(j*0.2*pi);
x2=0.9*exp(-j*0.2*pi);
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

%responses for sine waves of different frequencies
 Fs = 4800;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 0.25;             % seconds
   t = (0:dt:StopTime-dt)'; 
   
   %Fc/Fs may be equal to 0.01 to start with
   Fc=0.01*Fs;
X=sin(2*pi*Fc*t);
Y=filter(B, A, X);

figure(4)
plot(Y);
title('Frequency is 0.01*4800 Hz');

Fc=0.10*Fs;
X=sin(2*pi*Fc*t);
Y=filter(B, A, X);
figure(5);
plot(Y);
title('Frequency is 0.10*4800 Hz');

Fc=0.2*Fs;
X=sin(2*pi*Fc*t);
Y=filter(B, A, X);
figure(6);
plot(Y);
title('Frequency is 0.2*4800 Hz');
