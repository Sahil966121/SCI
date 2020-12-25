x=input(' enter the input sequence');
k=input('enter no of zeros to be inserted');
x_pad=[];
N=length(x);
for i=1:N
    x_pad=[x_pad,x(i),zeros(1,k)];
end
N1=length(x_pad);
f=0:N-1;
f1=0:N1-1;
ori=abs(fft(x));
new=abs(fft(x_pad));
figure(1);
subplot(211);plot2d3(f,ori);
subplot(212);plot2d3(f1,new);


