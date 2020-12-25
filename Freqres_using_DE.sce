clear;
clc;
close;
b=[1];
a=[1 -0.5];
m=0:length(b)-1;
p=0:length(a)-1;
w=-2*%pi:%pi/100:2*%pi;
num=b*exp(-%i*m'*w)
den=a*exp(-%i*p'*w)
H=num./den;
magH=abs(H);
angH=atan(imag(H),real(H));
figure;
subplot(211),plot2d(w./%pi,magH);
xtitle('Magnitude')
subplot(212),plot2d(w./%pi,angH);
xtitle('Phase')
