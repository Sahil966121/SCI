k=5;//no of cucles
a=4;//amplitude
x1=[0:a];
x=x1;
for i=1:k-1
    x=[x x1];
end
n=0:length(x)-1;
plot2d(n,x);
xtitle('Sawtooth','Time','Amplitude')
