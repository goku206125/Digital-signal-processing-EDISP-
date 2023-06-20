clear all;
%x1 case
N=2000;
N1=1000;
x1=[ones(1, N1), zeros(1, N-N1)];
figure(1)
plot(abs(fft(x1)));
k=2;
fn=k/length(x1);
fprintf('fn1=%s\n',fn)
fp=fn*1e6;
fprintf('fp1=%d\n', fp);

%x2 case
N=20;
N1=10;
x2=[ones(1, N1), zeros(1, N-N1)];
figure(2)
plot(abs(fft(x2)));
k=2;
fn=k/length(x2);
fprintf('fn2=%s\n',fn)
fp=fn*1e4;
fprintf('fp2=%d\n', fp);

%x3 case
N=40;
N1=20;
x3=[ones(1, N1), zeros(1, N-N1)];
figure(3)
plot(abs(fft(x3)));
k=2;
fn=k/length(x3);
fprintf('fn3=%s\n',fn)
fp=fn*1e4;
fprintf('fp3=%d\n', fp);