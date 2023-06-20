deviceReader = audioDeviceReader;
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);
process = @(x) x.*2;
disp('Begin Signal Input...')
tic
while toc<5
mySignal = deviceReader();
myProcessedSignal = process(mySignal);
deviceWriter(myProcessedSignal);
end
disp(toc);
disp('End Signal Input')
release(deviceReader)
release(deviceWriter)
