function [f,XAbs,XPhase,XRe,XIm] = computeSpectrum(x, sample_rate_Hz);
  n=length(x);
  N=n;
  y=fft(x);
  y=y(1:N/2+1);
  f=sample_rate_Hz/2*linspace(0,1,N/2+1);
  f=f';
  XAbs=abs(y);
  XPhase=angle(y);
  XRe=real(y);
  XIm=imag(y);
end
