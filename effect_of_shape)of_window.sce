clf()
N = 24;
whm = window('hn', 31); // Hamming window
wkr = window('hn', 51); // Hamming Kaiser window
wch = window('hn', 71); // Chebychev window

// Plot the window profile
subplot(411);
plot(whm);
subplot(412);
plot(wkr);
subplot(413);
plot(wch);

set(gca(), 'grid', [1 1]*color('gray'))
xlabel("n")
ylabel("w_n")
title(gettext("Profile plot"))

// Plot the magnitude of the frequency responses
n = 256;
[Whm,fr] = frmag(whm, n);
[Wkr,fr] = frmag(wkr, n);
[Wch,fr] = frmag(wch, n);
subplot(414);
plot(fr', 20*log10([Whm; Wkr; Wch]'))
set(gca(), 'grid', [1 1]*color('gray'))
xlabel(gettext("Pulsation (rad/s)"))
ylabel(gettext("Magnitude (dB)"))
legend(["Hamming N=24"; "Kaiser N=24, Beta=6"; "Chebychev N=24, dp=0.005"]);
title(gettext("Magnitude plot"))
