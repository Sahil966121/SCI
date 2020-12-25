//Goertzel Algorithm: DTMF Generation and Detection

//DTMF Generation
clear;
clc;
close;


//DTMF Generation and Detection: Generate two single tones of frequency f1 Hz and f2 Hz for a duration of 40 ms. Use a sampling rate of 8 kHz. Add the two signals. Plot the spectrum of this sum signal.  Decode the DTMF signal thus generated. Use Goertzel’s algorithm.

// DTMF Generation
row_number=input('Row Number');
column_number=input('Column Number');
fr=[697 770 852 941];
fc=[1209 1336 1477 1633];
fs=8000;
N=0.04*8000;//40 ms duration
f1=fr(row_number);
f2=fc(column_number);
tm=0:1/fs:(N-1)/fs;
x1=cos(2*%pi*f1*tm);
x2=cos(2*%pi*f2*tm);

x=x1+x2;

x_dft=abs(fft(x));
freq_axis=(0:N-1)*fs/N;
figure;
plot(freq_axis,x_dft);

//DTMF Detector
fr=[697 770 852 941];
fc=[1209 1336 1477 1633];

// Calculate the bin numbers for these frequencies
kr=ceil(fr*N/fs);
kc=ceil(fc*N/fs);



//To find WN_k (coefficient for first order Goertzel filter)
WN_kr=exp(%i*2*%pi*kr/N); 
WN_kc=exp(%i*2*%pi*kc/N); 

//Filteing Operation

for i=1:length(kr)
    yk_n(1)=x(1);
 for n=2:length(x)
    yk_n(n)=x(n)+WN_kr(i)*(yk_n(n-1));
 end
geortzel_op_kr(i)=abs(WN_kr(i)*yk_n(N));
end

for i=1:length(kc)
    yk_n(1)=x(1);
 for n=2:length(x)
    yk_n(n)=x(n)+WN_kc(i)*(yk_n(n-1));
 end
geortzel_op_kc(i)=abs(WN_kc(i)*yk_n(N));
end

row=find(geortzel_op_kr==max(geortzel_op_kr));
clm=find(geortzel_op_kc==max(geortzel_op_kc));

disp([row clm]);


