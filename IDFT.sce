clear; 
clc;
X=input('Enter the values of input sequence =');
M=length(X);
N=4;
for n=1:N
    x(n)=0;
    for k=1:M
        x(n)=x(n)+(1./N).*)(X(k)*exp(%i*2*%pi*(k-1)*(n-1)/N));
end
disp(x(n./N));
end
magH=abs(x./N);
phaH=atan(imag(x),real(x));
figure(1);
subplot(211);
plot2d3(magH);
xtitle('Magnitude')
subplot(212);
plot2d3(phaH);
xtitle('Phase')
