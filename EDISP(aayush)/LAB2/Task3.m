clear all;  
%intial state
   N = 512; 
      %%Sine wave:
   Fn = 1/64;                    
   x = sin(2*pi*Fn*(1:N));
   figure(1); 
   plot(log(abs(fft(x))));
   title('512 samples spectrum');
 
   
   %zero-pad to 1024
    x = sin(2*pi*Fn*(1:N));
   Nfft=1024;
   X=fft(x,Nfft);
   figure(2)
   plot((0:Nfft-1)/Nfft, log10(abs(X)));
    title('zero-pad to 1024 fft');
    
     %zero-pad to 2048
      x = sin(2*pi*Fn*(1:N));
   Nfft=2048;
   X=fft(x,Nfft);
   figure(3)
   plot((0:Nfft-1)/Nfft, log10(abs(X)));
    title('zero-pad to 2048 fft');
    
     %zero-pad to 1024 ifft
      x = sin(2*pi*Fn*(1:N));
   Nfft=1024;
   X=ifft(fft(x,Nfft));
   figure(4)
   plot((0:Nfft-1)/Nfft, log10(abs(X)));
    title('zero-pad to 1024 ifft');
 
     %zero-pad to 2048 ifft
      x = sin(2*pi*Fn*(1:N));
   Nfft=2048;
   X=ifft(fft(x,Nfft));
   figure(5)
   plot((0:Nfft-1)/Nfft, log10(abs(X)));
    title('zero-pad to 2048 ifft');
    