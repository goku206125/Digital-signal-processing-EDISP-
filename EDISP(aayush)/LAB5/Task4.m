deviceReader = audioDeviceReader;
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);

%filterDesigner;
%pause;
zi=[];
input=[];
output=[];
process = @(x) x.*2;
disp('Begin Signal Input...')
%(1+z.^(-1)).^3;
%transient state length is 4
 [b, a]=sos2tf(SOS);
tic
while toc<5
mySignal = deviceReader();
input=[input,mySignal];

%first
%X=filter(b,a,mySignal);

%second, zi,zf parameters
[X,zi]=filter(b,1,mySignal,zi);

output=[output,X];
deviceWriter(X);
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