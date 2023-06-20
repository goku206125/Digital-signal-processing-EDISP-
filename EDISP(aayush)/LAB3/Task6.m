%Record Microphone Input
%after first recording comment everything up to line 24

Fs = 8000 ;    
nBits = 16 ; 
nChannels = 1 ; 
ID = -1; % default audio input device 

recObj = audiorecorder(Fs,nBits,nChannels,ID); 

recordTime = 5; %[seconds]
numberOfSamples=recordTime*Fs;

fprintf('Number of samples is %d\n', numberOfSamples);

disp('Starting Recording.')
recordblocking(recObj, recordTime);
disp('End of Recording.');

play(recObj);

y = getaudiodata(recObj);


figure(1)
plot(y);
title('Original signal');

figure (2)
spectrogram(y, hamming(floor(0.04*Fs)), (floor(0.04*Fs)-10), 1024, Fs);

figure(3)
spectrogram(y, rectwin(floor(0.04*Fs)), (floor(0.04*Fs)-10), 1024, Fs);

