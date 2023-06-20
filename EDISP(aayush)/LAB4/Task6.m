%Record Microphone Input
%after first recording comment everything up to line 24

Fs = 44100 ;    
nBits = 16 ; 
nChannels = 2 ; 
ID = -1; % default audio input device 

recObj = audiorecorder(Fs,nBits,nChannels,ID); 

recordTime = 5; %[seconds]
numberOfSamples=recordTime*Fs;

fprintf('Number of samples is %d\n', numberOfSamples);

disp('Starting Recording.')
recordblocking(recObj, recordTime);
disp('End of Recording.');

play(recObj);

x = getaudiodata(recObj);

figure(1)
plot(x);
title('Original signal');

fn=0.025;
z=0.5*sin(2*pi*fn*[0:size(x,1)-1])';
y=x+z;

figure(2);
plot(y);
title('Original signal with interference');
soundsc(y, Fs, nBits);

%zeroes
x1=exp(j*2*pi*fn);
x2=exp(-j*2*pi*fn);
Roots = [x1,x2];
B=poly(Roots);

%poles
x3=0.9*exp(j*2*pi*fn);
x4=0.9*exp(-j*2*pi*fn);
Roots2 = [x3,x4];
A=poly(Roots2);

k=filter(B, A, y);
figure (3);
plot(k);
title('Signal after passing through filter');
%soundsc(k, Fs, nBits);


figure (4);
freqz(B, A, 1000);
('Frequency response of the filter');





