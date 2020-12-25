clear;
fm=10;
fs=20;
m=2;//no of cycles
t=0.001:1/fs:m/fm;
x=sin(2*%pi*fm*t);
No_samples=m*fs/fm;
x_fft=fft(x);
x_mag=abs(x_fft);
N=length(x);
N1=length(x_fft);
f1=(0:N1-1).*fs/N;
f=(0:N-1).*fs/N;
subplot(211);
plot(f,x);
subplot(212);
plot2d3(f1,x_fft);



