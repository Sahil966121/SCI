clear;
clc;
x=input('Enter the sequence');
k=input('Enter the nmber of times the signal repeats');
x1=x;
for i=1:k
    x1=[x1 x];
end
x=abs(fft(x));
x1=abs(fft(x1));
subplot(211);plot2d3(x);
subplot(212);plot2d3(x1);
