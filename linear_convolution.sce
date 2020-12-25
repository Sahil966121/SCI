clc;
clear;
close;
x1=input('x(n)=');
x2=input('h(n)=');
L1=length(x1);
L2=length(x2);
N=L1+L2-1;
x1=[x1,zeros(1,N-L1)];
x2=[x2,zeros(1,N-L2)];
//Linear convolution in freq domain
X1=fft(x1);
X2=fft(x2);
Y=X1.*X2;
y=ifft(Y);
disp(y,'Linear convolution y=')
subplot(3,1,1);plot2d3(x1);xtitle('input signal x1','n','x1[n]');
subplot(3,1,2);plot2d3(x2);xtitle('input signal x2','n','x2[n]');
subplot(3,1,3);plot2d3(Y);xtitle('output signal Y','n','Y[n]');
