Design a digital FIR low pass filter with following specifications.
a) Pass band cut-off frequency :0.3π rad
b) Pass band ripple :0.25 dB
c) Stop band cut-off frequency :0.45π rad
a) Stop band attenuation : 50 dB

I step: Choose an appropriate window function from the stop band attenuation
specification.
As rs = 50 dB select Hamming window.
(Note: Though Blackman window can be used it results in higher transition
bandwidth)
II step:Compute the order of the FIR filter (number of coefficients) using the relation
N≥ 2πk/(wp-ws)[ k=4 for Hamming window]
N≥ 53.5 (choose N=55)
III step: Choose the cut-off frequency of the filter as wc=wp= 0.3* pi rad.
IV step: Choose α = (N-1)/2 so that linear phase is ensured.
V step: The impulse response of the filter is given by
sin(wc(n-α))
h(n- α)= --------------------------- * w(n) where w(n) is window function
π (n-α) for0<n<N-1 & n ≠ α
h(n- α)=sin(0.3*pi(n-27))/(pi*(n-27))*[0.54-0.46*cos(2*pi*n/(N-1))]
for0<n<N-1 & n ≠ α
For ex : The impulse response coefficients are
h(0)=0.00029114 = h(54)
h(1)= -5.9806*10-4 = h(53)........
Note: when n=α
i.e. h(27) = wc/pi*w(27) =0.3*1=0.3
VI. Frequency response can be obtained using equation
H(ejw) = e-jw(α ) * [∑2h(n)cos(w(n- α))+h((N-1)/2)]
Note: The symmetry of the impulse response must be verified and the frequency response
must satisfy the specifications.


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

