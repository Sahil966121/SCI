clc;
clear all;
close;
wp=input('Enter the pass band edge in rad');
ws=input('Enter the stop band edge in rad');
rs=input('Enter the stop band attenuation');

freq_points=1024;
k=4;//hamming window(decided based on stop and attenuation)
trw=ws-wp;
N=(k*2*%pi/trw);
N=ceil(N);
if modulo(N,2)==0 then
    N=N+1;
end
wc=wp;
alph=(N-1)/2;
for n=0:N-1
    if n==alph
        hdn_minusalph(n+1)=wc/%pi;
    else
        hdn_minusalph(n+1)=sin(wc.*(n-alph))./(%pi.*(n-alph));
        
end
end

wndw=window('hm',N);
hn=hdn_minusalph.*wndw';
n=0:N-1;
figure(1);subplot(311);plot2d3(n,wndw);xlabel('n');ylabel('wndw');
subplot(312);plot2d3(n,hdn_minusalph);xlabel('n');ylabel('hdn_minusalph');
subplot(313);plot2d3(n,hn);xlabel('n');ylabel('hn');
h=[hn'zeros(1,freq_points-length(hn))];
H=fft(h);
mag_H=20*log10(abs(H));
ph=atan(imag(H),real(H));
phase_H=unwrap(ph);
k1=0:freq_points-1;
omega=k1*2*%pi/(freq_points);
figure(2);subplot(411);plot2d(omega(1:freq_points/2),mag_H(1:freq_points/2));
xtitle('Magnitude response','w(rad)','Magnitude(dB)');
subplot(412);plot2d(omega(1:freq_points/2),phase_H(1:freq_points/2));
xtitle('Phase response','w(rad)','phase(rad)');

