clc;
N=input("Enter the length of the unit step sequence");
n=-N:1:N-1;
unit_step=[zeros(1,N) ones(1,N)]
plot2d(n,unit_step);
xtitle("unit step sequence")

