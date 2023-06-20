deviceReader = audioDeviceReader;
deviceWriter = audioDeviceWriter('SampleRate',deviceReader.SampleRate);
zi=[];
input=[];
output=[];
process = @(x) x.*2;
disp('Begin Signal Input...')

%(1+z.^(-1)).^3;
b=[1 3 3 1];%transient state length is 4

tic
while toc<5
mySignal = deviceReader();
input=[input,mySignal];

%X=filter(b,1,mySignal);
%1(a)%
%X=filter(b,1,mySignal(10:end-10));
%1(b)%
[X,zi]=filter(b,1,mySignal,zi);

output=[output,X];
deviceWriter(X);
end

figure(1);
subplot(2,1,1);
plot(input);
title('Signal before filtering');

subplot(2,1,2); 
plot(output);
title('Signal after filtering');

disp(toc);
disp('End Signal Input')


release(deviceReader)
release(deviceWriter)