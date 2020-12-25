clc;clear;close;
x=input('x(n)=');
h=input('h(n)=');
L1=length(x);
L2=length(h);
L3=L1+L2-1;
for n=1:L3
    con_sum=0;
    for k=1:n
        if(((n-k+1)<=L2)&(k<=L1))
            con_sum=con_sum+x(k)*h(n-k+1);
end
y(n)=con_sum;
end
end
disp(y,'Convolution sum using direct Formula Method=')
subplot(3,1,1);plot2d3(x);xtitle('input signal x','n','x[n]');
subplot(3,1,2);plot2d3(h);xtitle('input signal h','n','h[n]');
subplot(3,1,3);plot2d3(y);xtitle('output signal y','n','y[n]');
