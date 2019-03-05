function [t,x] = generateSinusoidal(amplitude, sampling_rate_Hz, frequency_Hz, length_secs, phase_radians)
  A=amplitude;
  omega=2*pi*frequency_Hz;
  phase=phase_radians;
  t1=1/sampling_rate_Hz;
  n=length_secs*sampling_rate_Hz;
  for i=0:n
      t(i+1)=i*t1;
      x(i+1)=A*sin(omega*t(i+1)+phase);
  end
  t=t';
  x=x';
end
