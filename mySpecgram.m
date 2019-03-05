function [freq_vector, time_vector,magnitude_spectrogram] = mySpecgram(x,  block_size, hop_size, sampling_rate_Hz, window_type) 
  [t, X] = generateBlocks(x, sampling_rate_Hz, block_size, hop_size);
  N=size(X,2);
  time_vector=t;
  magnitude_spectrogram=zeros(block_size/2+1,N);
  for i=1:N
     x1=X(:,i);
     if window_type==1
         x1=x1.*rectwin(block_size);
     elseif window_type==2
         x1=x1.*hann(block_size);
     end
     y=fft(x1);
     magnitude_spectrogram(:,i)=y(1:block_size/2+1);
     freq_vector=sampling_rate_Hz/2*linspace(0,1,block_size/2+1);
 end
