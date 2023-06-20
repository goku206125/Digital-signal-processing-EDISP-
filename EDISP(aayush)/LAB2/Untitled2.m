clear all;  
%intial state
   N = 512; 
      %%Sine wave:
   Fn = 1/64;                    
   x1 = sin(2*pi*Fn*(1:N));
   figure(1); 
   plot(log10(abs(fft(x1))),'.-');
   title('512 samples spectrum fft');
   
    N = 1024; 
      %%Sine wave:
   Fn = 1/64;                    
   x2 = sin(2*pi*Fn*(1:N));
   figure(2); 
   plot(log10(abs(fft(x2))));
   title('1024 samples spectrum fft');
   
    N = 2048; 
      %%Sine wave:
   Fn = 1/64;                    
   x3 = sin(2*pi*Fn*(1:N));
   figure(3); 
   plot(log10(abs(fft(x3))));
   title('2048 samples spectrum fft');
   
   
   %zero-pad to 1024 ifft
    x4 = sin(2*pi*Fn*(1:N));
   Nfft=1024;
   X=fft(x4,Nfft);
   figure(4)
   plot((0:Nfft-1)/Nfft, log10(abs(X)));
    title('zero-pad to 1024 ifft');
    
     %zero-pad to 2048 ifft
      x5 = sin(2*pi*Fn*(1:N));
   Nfft=2048;
   X=fft(x5,Nfft);
   figure(5)
   plot((0:Nfft-1)/Nfft, log10(abs(X)));