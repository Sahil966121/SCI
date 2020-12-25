clc;clear hd hn ;
wp=0.4*%pi;ap=3;
ws=0.6*%pi;as=40;trw=ws-wp;
dp=((10.^(-ap/20))-1)./((10.^(-ap/20))+1);
ds=(10.^(-as/20));
d=min(abs(dp),ds);
A=-20*log10(d);
N=ceil((A-7.95)/(2.285*trw));
r=modulo(N,2);
if r==0 then
    N=N+1;
end
beta = 0.1102 * (A-8.7);
win=window('kr',N,beta);
wc=wp;
aph=(N-1)/2;
for n=0:N-1
    if n==aph
        hd(n+1)=wc/%pi;
     else 
         hd(n+1)=sin(wc.*(n-aph))./(%pi.*(n-aph));
end
end
hn=hd.*win';
n=0:N-1;
subplot(311);plot2d3(n,win);xlabel('n');ylabel('wndw');
subplot(312);plot2d3(n,hd);xlabel('n');ylabel('hd');
subplot(313);plot2d3(n,hn);xlabel('n');ylabel('hn');
hn=[hn'zeros(1,1024-N)];
a=fft(hn);
mag=20*log10(abs(a));
phi=atan(imag(a),real(a));
k=0:1023;
omega=k*2*%pi/1024;
figure;
subplot(211),plot2d(omega(1:512),mag(1:512));
xtitle('Magnitude response','w(rad)','Magnitude (dB)');
subplot(212),plot2d(omega(1:512),unwrap(phi(1:512)));
xtitle('Phase Response','w(rad)','Phase(degress)');
