T=1;
f1=1000;
f2=5000;

Fs=20e3;
Ts=1/Fs;

t=0:Ts:T;
phase= 2*pi*(f1*t + (f2-f1)/(2*T)*t.^2);
x=[zeros(1,500), cos(phase), zeros(1,500)];
figure(1);
plot(x);
title('LFM signal');

figure (2);
spectrogram(x, rectwin(100), 90, 1024, Fs);
title ('Rectangular window L=100');
figure (3);
spectrogram(x, rectwin(50), 40, 1024, Fs);
title ('Rectangular window L=50');

figure (4);
spectrogram(x, kaiser(100,20), 90, 1024, Fs);
title ('Kaiser window L=100 Beta=20');
figure (5);
spectrogram(x, kaiser(50,20), 40, 1024, Fs);
title ('Kaiser window L=50 Beta=20');

figure (6);
spectrogram(x, kaiser(100,70), 90, 1024, Fs);
title ('Kaiser window L=100 Beta=70');
figure (7);
spectrogram(x, kaiser(50,70), 40, 1024, Fs);
title ('Kaiser window L=50 Beta=70');

soundsc(x, Fs);