clear; 
clc;
x=input('Enter the values of input sequence =');
M=length(x);
N=8;
for k=1:N
    X(k)=0;
    for n=1:M
        X(k)=X(k)+(x(n)*exp(-%i*2*%pi*(k-1)*(n-1)/N));
end
disp(X(k));
end
magH=abs(X);
phaH=atan(imag(X),real(X));
figure(1);
subplot(211);
plot2d3(magH);
xtitle('Magnitude')
subplot(212);
plot2d3(phaH);
xtitle('Phase')
