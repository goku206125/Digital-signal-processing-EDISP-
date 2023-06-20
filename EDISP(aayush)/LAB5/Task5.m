deviceReader = audioDeviceReader;
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);

filterDesigner;
pause;

input=[];
output=[];
process = @(x) x.*2;
disp('Begin Signal Input...')

 [b, a]=sos2tf(SOS);
 h=freqz(b,a,1024);
 H=fft(h);
tic
while toc<5
mySignal = deviceReader();
mySig=fft(mySignal);
input=[input,mySignal];


%X=filter(b,a,mySig);
%myProcessedSignal = process(X);
X=mySig.*H;
x=ifft(X);
output=[output,x];
deviceWriter(x);
end
%frequency response
fs=44100;
NFFT=1024;
figure(1);
subplot(2,1,1);
plot(fs*([0:NFFT-1]-NFFT/2)/NFFT,db(abs(fftshift(fft(input)))));
title('Spectrum before filtering');

subplot(2,1,2); 
plot(fs*([0:NFFT-1]-NFFT/2)/NFFT,db(abs(fftshift(fft(output)))));
title('Spectrum after filtering');

disp(toc);
disp('End Signal Input')


release(deviceReader)
release(deviceWriter)