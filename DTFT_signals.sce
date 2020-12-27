clear;clc;close;
h=input('enter the input sequence'); //h=[1 1 1 1 1]
n=0:length(h)-1;
w=-%pi:%pi/4:%pi; //To evaluate X(ejw) at equi-spaced frequencies
wn= n'*w;
minus_jwn= -%i*n'*w
H=h*exp(minus_jwn);
magH=abs(H);
angH=atan(imag(H),real(H));
figure();
subplot(311),plot2d3(n,h);
xtitle('Impulse Response','time index n');
subplot(312),plot2d(w,magH);
xtitle('Magnitude Response', 'frequency in rad', 'Magnitude');
subplot(313),plot2d(w,angH);
xtitle('Phase Response', 'frequency in rad', 'Phase');
