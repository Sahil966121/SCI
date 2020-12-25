clear;clc;close
h=input('Enter the samples of the input sequence');
n=0:length(h)-1;
w=0:%pi/4:2*%pi;
wn=n'*w;
H=h*exp(-%i*wn);
magH=abs(H);
angH=atan(imag(H),real(H));
figure;
subplot(311),plot2d3(h);
xtitle('DTFT_Signals')
subplot(312),plot2d(w./%pi,magH);
xtitle('Magnitude')
subplot(313),plot2d(w./%pi,angH);
xtitle('Phase')
