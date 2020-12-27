Design : Kaiser window is an adjustable window function which provides flexible
transition bandwidths. The window function is given by
w(n) = I0[ β √ ( 1 – (1 – 2n / (M-1)2 ] / I0[β]
where I0 is the modified zero-order Bessel function given by
I0(x) = 1 + ∑ [ (x/2)k
/ k !]2
which is positive for all real values of x.

The parameter β controls the minimum stopband attenuation and can be chosen to
yield different transition bandwidths for the same order.
• If β = 5.658, then transition width is equal to 7.8 pi /N, and the minimum
stopband attenuation is equal to 60 dB.
• If β = 4.538, then the transition width is equal to 5.8 pi/N, and the minimum
stopband attenuation is equal to 50 dB.

Empirical design equations:
Given wp, ws, rp and As, the parameters N and β are given by
transition width = ∆w = ws-wp
Filter length N ~ (A – 7.95 / 2.285 ∆w) + 1
Parameter β = 0.1102( A-8.7), A ≥ 50

0.5842(A -21)0.4 + 0.07886 (A-21), 21 < A <50
Steps:
1. Find δp from

, δp=-0.0144

2. Find δs from

10 20log A
s s
= −  , δs=0.0032

3.
   = min , ( p s ), δ=0.0032
4.
10 A = −20log 
, A=49.897 dB
5. Choose the order of the filter using

N = (A – 7.95 / 2.285 ∆w) = 58.4 ≈59
6. Determine β based on the value of N

β = 0.1102( A-8.7), As, A ≥ 50, β = 4.539

7. Obtain the Kaiser window function using
w_kaiser = ( kaiser(N, beta))';
8. The impulse response of the filter is given by

h = hd .* w_kaiser;
























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
