clear all;  
%intial state
   N = 512; 
      %%Sine wave:
   Fn = 1/64;                    
   x = sin(2*pi*Fn*(1:N));
   figure(1); 
   plot(abs(fft(x)),'.-');
   title('512 samples spectrum');
   
   Nfft=2048*8;
   X=fft(x,Nfft);
   figure(2)
   plot((0:Nfft-1)/Nfft, abs(X));
    title('zero-pad to 2048');
    
     X=fft(x.*hamming(N)',Nfft);
   figure(3)
   plot((0:Nfft-1)/Nfft, 20*log10(abs(X)));
    title('windowing');