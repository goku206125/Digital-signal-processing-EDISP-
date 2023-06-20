deviceReader = audioDeviceReader;
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);

filterDesigner;
pause;

input=[];
output=[];
process = @(x) x.*2;
disp('Begin Signal Input...')

%transient state length is 4
tic
while toc<5
mySignal = deviceReader();
input=[input,mySignal];


X=filter(b,1,mySignal);

output=[output,X];
deviceWriter(X);
end
%frequency response
fs=44100;
NFFT=1024;
figure(1);
subplot(2,1,1);
plot(fs*([0:NFFT-1]-NFFT/2)/NFFT,db(abs(fftshift(fft(input)))));

subplot(2,1,2); 
plot(fs*([0:NFFT-1]-NFFT/2)/NFFT,db(abs(fftshift(fft(output)))));


disp(toc);
disp('End Signal Input')


release(deviceReader)
release(deviceWriter)