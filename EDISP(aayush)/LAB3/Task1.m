
x1=sin(0.24*pi*[0:199]);
x2=sin(0.72*pi*[200:399]);
x=[x1 x2];

%(a)
figure(1);
plot (x);
title('Signal composed of x1 and x2');

%(b)you need to open LCPS_plot.m from lab changes/L3 folder
figure (2);
LCPS_plot(x);

%(c)
figure (3);
LCPS_plot(x.*rectwin(length(x))');

%(d)
figure (4);
LCPS_plot(x.*hamming(length(x))');

%(e)
x3=sin(0.24*pi*[0:199]);
x4=sin(0.72*pi*[200:399]);
x5=[x4 x3];
figure (5);
LCPS_plot(x5);
%no differences

%(f)
g=hamming(100);
n=[1:500];
figure (6)
[X,f,n]=LCPS_swifft(x,g,n); 

%(g)
figure (8);
spectrogram(x,hamming(100),90);