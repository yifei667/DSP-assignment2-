[t,x] = generateSinusoidal(1.0, 44100,400, 0.5,pi/2 );
fs=44100;
[t1,x1]=generateSquare(1.0,44100,400,0.5,0);
n=round(0.005*fs);
figure(1)
plot(t(1:n),x(1:n),t(1:n),x1(1:n));
xlabel('time/s');
ylabel('amplitude');
title('5ms of the sinusoid wave and square wave');
[f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, fs);
figure(2)
subplot(2,1,1)
plot(f,XAbs);
xlabel('Frequency(Hz)');
ylabel('magnitude');
title('plot of magnitude of sine wave');
subplot(2,1,2)
plot(f,XPhase);
xlabel('Frequency(Hz)');
ylabel('phase/pi');
title('plot of phase of sine wave');
[f1,XAbs1,XPhase1,XRe1,XIm1] = computeSpectrum(x1,fs);
figure(3)
subplot(2,1,1)
plot(f1,XAbs1);
xlabel('Frequency(Hz)');
ylabel('magnitude');
title('plot of magnitude of square wave');
subplot(2,1,2)
plot(f1,XPhase1);
xlabel('Frequency(Hz)');
ylabel('phase/pi');
title('plot of phase of square wave');
[freq_vector, time_vector,magnitude_spectrogram] = mySpecgram(x1, 2048,1024,fs,1);
figure(4)
title('spectrogram for square wave using rect window')
subplot(2,1,1)
h = newplot;
hRotate = uigettool(ancestor(h,'Figure'),'Exploration.Rotate');
hndl = imagesc(time_vector*1000,freq_vector,10*log10(abs(magnitude_spectrogram)+eps));
hndl.Parent.YDir = 'normal'
xlabel('time/ms');
ylabel('frequency/Hz');
subplot(2,1,2)
spectrogram(x1,rectwin(2048),1024,2048,fs,'yaxis')
[freq_vector1, time_vector1,magnitude_spectrogram1] = mySpecgram(x1, 2048,1024,fs,2);
figure(5)
title('spectrogram for square wave using hanning window')
subplot(2,1,1)
h = newplot;
hRotate = uigettool(ancestor(h,'Figure'),'Exploration.Rotate');
hndl1 = imagesc(time_vector1*1000,freq_vector1,10*log10(abs(magnitude_spectrogram1)+eps));
hndl1.Parent.YDir = 'normal'
xlabel('time/ms');
ylabel('frequency/Hz');
subplot(2,1,2)
spectrogram(x1,hamming(2048),1024,2048,fs,'yaxis')