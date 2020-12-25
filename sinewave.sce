clc;clear all;
A=input('Enter the amplitude of the input signal: ');
t=-5*%pi:0.1*%pi:5*%pi;
x=A*sin(t);
plot2d(x);
xtitle('sine wave','Time','Amp')
