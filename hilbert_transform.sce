clc;
clear hd ;
N=13;
freq_points=1024;
windowfn=window('re',N);
n=0:(N-1);
aph=(N-1)/2;
for n=0:N-1
    if n==aph
        hd(n+1)=0;
    else
        hd(n+1)=(2/%pi)*((sin((%pi/2)*(n-aph)).^2)./(n-aph));
        end
end
n=0:N-1;
hn=hd.*windowfn';
omega=-%pi:2*%pi/(freq_points-1):%pi;
figure;
plot2d3(n,hn);
hn=[hn'zeros(1,1024-N)];
a=fft(hn);
mag=abs(a);
figure;
plot2d(omega,mag);
xtitle('Magnitude response','w(rad)','Magnitude');
