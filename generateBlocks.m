function [t, X] = generateBlocks(x, sample_rate_Hz, block_size, hop_size) 
  N=ceil([length(x)-block_size]/hop_size);
  length_zero=N*block_size-length(x);
  zeropad=zeros(length_zero,1);
  x=[x',zeropad'];
  num=[length(x)-block_size]/hop_size+1;
  t=zeros(num,1);
  X=zeros(block_size,num);
  for i=0:num-1
      t(i+1)=(hop_size*i+1)/sample_rate_Hz;
      X(:,i+1)=x(i*hop_size+1:i*hop_size+block_size);
  end
end
