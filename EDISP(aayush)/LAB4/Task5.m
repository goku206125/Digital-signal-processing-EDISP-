Wp=0.2*pi;
Ws=0.3*pi;
Rp=0.5;
Rs=60;
%Chebyshev type 1
[n, Wc] =cheb1ord(Wp, Ws, Rp, Rs);
[B,A]=cheby1(n, Rp, Wc);
figure(1);
zplane(B,A);
title ('zeroes and poles for Chebyshev type 1');
figure (2);
N=1000;
freqz(B,A,N);
title ('frequency response for Chebyshev type 1');

%Cauer(eleptical)
[n, Wc]=ellipord(Wp, Ws, Rp, Rs);
[B,A]=ellip(n, Rp, Rs, Wc);
figure (3);
zplane(B,A);
title ('zeroes and poles for Cauer(elliptical)');
figure (4);
N=1000;
freqz(B,A,N);
title ('frequency response for Cauer(elliptical)');