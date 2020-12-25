clc;
clear;
close;
x1=input("enter the input sequence value x(n)=");
x2=input("Enter the input sequence value h(n)=");
N=input("Enter the value of N point circular convolution N=");
L1=length(x1);
L2=length(x2);
x1=[x1,zeros(1,N-L1)];
x2=[x2,zeros(1,N-L2)];

for n=0:N-1
    x3(n+1)=0;
for m=0:N-1
    i=modulo(n-m,N)
if(i<0)
i=i+N;           
end
x3(n+1)=x3(n+1)+x1(m+1)*x2(i+1);
end 
end
disp(x3,'circular convolution x3[n]=')
subplot(3,1,1);plot2d3(x1);xtitle('input signal x1','n','x1[n]');
subplot(3,1,2);plot2d3(x2);xtitle('impulse signal x2','n','x2[n]');
subplot(3,1,3);plot2d3(x3);xtitle('output signal x3','n','x3[n]');

