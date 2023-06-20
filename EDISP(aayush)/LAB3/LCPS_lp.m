function [ XX ] = LCPS_lp(x,g,f)
%function XX=stft_lp(x,g,f)
%
% x - sygnal
% g - gotowe okno
% f - czestotliwosc 
% XX - widma chwilowe

if nargin < 1 ,
   help stft_lp;
   error('Zapamietaj to na przyszlosc !!!!');
end %if
if nargin < 2 ,
   g=hamming(length(x)/5);
end %if
if nargin < 3 ,
   f=-0.5:0.01:0.5;
end %if
x=x(:);
g=g(:);
f=f(:);
ng=length(g);
nx=length(x);
nf=length(f);
%x=[zeros(ng,1); x]; %dodanie zer na poczatku
x=[x;zeros(ng-1,1)]; %uzupelnianie zerami na koncu
nx=length(x); % nowa dlugosc po dodaniu zer
Xm=(x*ones(1,nf)).*exp(-j*(1:nx)'*2*pi*f'); %macierz sygnalow zmodulowanych
% kazda kolumna jest sygnalem zmodulowanym kolejna czestotliwoscia z listy f
XX=zeros(nx,nf);
g=g(ng:-1:1); %odwracanie okna (preludium do splotu)
clc;
pause(0.01); % aby zadzialalo clc
for i = 1:nf
   XX(:,i)=filter(g,1,Xm(:,i)); % filtracja DP sygnalow zmodulowanych
   home;
   fprintf('%4g/%4g\n',i,nf);
end %for
XX=20*log10(abs(XX));
ymin=10*floor(median(min(XX))/10)-10;
ymax=10*ceil(max(max(XX))/10);
hold off;
clf;
set(gcf,'DoubleBuffer','ON'); %aby wykresy plynnie sie zmienialy
for i = 1:nf
   if i>1      
      plot(1:nx,XX(:,i-1),'g', 1:nx,XX(:,i),'r');
   else
      plot(1:nx,XX(:,i),'r');
      hold on;
   end %if
   axis([0,nx,ymin,ymax]);
   xlabel('Numer probki')
   ylabel('Amplituda [dB]');
   title('Widmo chwilowe.');
   grid on;
end %for
hold off;
XX=max(XX,-50);
