function [t,x] = generateSquare(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians)
  A=amplitude;
  omega=2*pi*frequency_Hz;
  phase=phase_radians;
  t1=1/sampling_rate_Hz;
  n=length_secs*sampling_rate_Hz;
  for i=0:n
      t(i+1)=i*t1;
      x(i+1)=4/pi*A*[sin(omega*t(i+1)+phase)];
      for j=1:12
          k=2*j+1;
          x(i+1)=x(i+1)+4/pi*A*[sin(k*omega*t(i+1)+k*phase)]/k;
      end
  end
  t=t';
  x=x';
end
