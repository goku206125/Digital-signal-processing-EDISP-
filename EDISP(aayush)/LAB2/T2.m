clear all;
%a case
N=1024;
N1=512;
x1=[ones(1, N1), zeros(1, N-N1)];

figure(1)

plot(abs(fft(x1)));
title('a) fft');
%figure (2)
%plot (x1);

%b case
N=1024;
N1=124;
x2=[ones(1, N1), zeros(1, N-N1)];

figure(3)

plot(abs(fft(x2)));
title('b) fft');

%c case

   N = 1024; 
   
   %%Sine wave:
   Fn = 1/64;                    
   x = sin(2*pi*Fn*(1:N));
   
   figure(4);
  
   plot(abs(fft(x)));
    title('c) fft');
%d case
   N = 1024; 
   
   %%Sine wave:
   Fn = 1/99;                    
   x = sin(2*pi*Fn*(1:N));
   
   figure(5);
  
   plot(abs(fft(x)));
    title('d) fft');
%e case 
   thetac=pi/4;
   n=0:1023;
   xe=exp(1i*thetac*n);
   
   figure(6);
  
   plot(abs(fft(real(xe))));
    title('e) fft');
    
 %f case
 N=1024;
N1=32;
x1=[ones(1, N1), zeros(1, N-N1)];

figure(7)
plot(abs(fft(x1)));
title('f) fft');

figure (8);
plot(angle(fft(x1)));
title ('f) phase fft NOT for report');
 %g case
 N=1024;
N1=32;
x1=[zeros(1,5), ones(1, N1), zeros(1, N-N1-5)];

figure(9)

plot(abs(fft(x1)));
title('g) fft ');
   
figure (10);
plot(angle(fft(x1)));
title ('g) phase fft compare with fig8 NOT report');