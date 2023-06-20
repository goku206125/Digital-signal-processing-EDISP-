function [X, f_axis, n] = LCPS_swifft(x, g, n, X)
%function [X, f_axis, n]=c3_swifft(x,g,n,X)
% x - signal
% g - window which is ready
% n - last minutes of window
% X - timelimited windows(jesli sa podane w wywolaniu - tylko rysujemy!)
%     jesli X='noplot' - tylko liczymy
% f_axis - normalized frequencies (for axes)

if nargin < 1 ,
   help swifft;
   error('REMEMBER FOR THE FUTURE!!!!');
end %if

if nargin < 2 ,
   g=hamming(length(x)/8);
end %if

if nargin < 3 ,
   n=length(g):8:length(x);
end %if

x=x(:);
g=g(:);
ng=length(g);
nx=length(x);
nn=length(n);
if ng==nx ,
   tit='Widmo sygnalu';
else
   tit='Widmo chwilowe';
end %if

x=[zeros(ng,1); x]; %dodanie zer na poczatku
x(max(n)+ng)=0; %uzupelnianie zerami na koncu
f_axis=((0:ng-1)-ng/2)/ng;
g=g(ng:-1:1); %odwracanie okna (preludium do splotu)
clc;
if nargin<4 ,
   liczwidmo=1;
   rysuj=1;
   % domyslne...
else
   % ktos cos chce
   if isstr(X) ,
      liczwidmo=1;
      rysuj=0;
   else
      liczwidmo=0;
      rysuj=1;
   end %if
end %if

if liczwidmo ,
   % trzeba policzyc widmo
   X=zeros(ng,nn);
   pause(0.01); %potrzebne aby prawidlowo zadzialalo clc 
   for i = 1:nn
      X(:,i)=eps+abs(fftshift(fft(x(n(i)+(1:ng)).*g)));
      clc;
      fprintf('%4g/%4g\n',i,nn);
   end %for
else
   %trzeba sprawdzic zdrowy rozsadek wywolujacego
   [mrows,ncols]=size(X);
   if mrows~=ng ,
      error('Dlugosc okna nie pasuje do dlugosci macierzy widm');
   end %if
   if ncols~=nn ,
      error('Liczba punktow nie pasuje do szerokosci macierzy widm');
   end %if
end %if

   ymin=10*floor(median(20*log10(min(X)))/10)-10;
   ymax=10* ceil(   max(20*log10(max(X)))/10);
   
if rysuj
 	warning off;
   clf;
 	set(gcf,'DoubleBuffer','ON'); %aby wykresy plynnie sie zmienialy
   %subplot(211);
   uaxis=[-ng-3+min(n) length(x)-ng+2 min(x) max(x)+1.05*(max(x)-min(x))/2];
   ag=max(x)+(max(x)-min(x))/2*([0;g;0]+0.025); % do rysowania okna nad sygnalem
   %axis(uaxis);
   subplot(211);
   axis(uaxis);
   title('Sygnal i okno')
   xlabel('Numer próbki')
   ylabel('Wartosc próbki')

   subplot(212);
   axis([-.5 .5 ymin ymax]);
   title(tit)
   xlabel('Czestotliwosc unormowana: f/fs')
   ylabel('Amplituda [dB]');
   grid;
   
   if nn>1
      disp('Nacisnij i ew. przytrzymaj klawisz spacji aby obejrzec animacje');

   end %if
   speed=3; %predkosc animacji wykresu wart > 0
   ii=speed;
   for i = 1:nn
      if ii==speed
      	             
         ii=0;       
      	subplot(211); %rysowanie gornego wykresu
      	plot((1:length(x))-ng,x,'b',n(i)+[-ng+1,-ng+1:0,0],ag,'r');
      	axis(uaxis);
			title('Sygnal i okno')
			xlabel('Numer próbki')
      	ylabel('Wartosc próbki')
    
      	subplot(212); %rysowanie dolnego wykresu
         if i>1
         	plot(f_axis,20*log10(X(:,(i-speed))),'g', f_axis,20*log10(X(:,i)),'k');
				title(tit)
		   	xlabel('Czestotliwosc unormowana: f/fs')
         	ylabel('Amplituda [dB]');
         	axis([-.5 .5 ymin ymax]);
%         	grid;         
            uchwyt=get(gcf,'children');
      	else
         	plot(f_axis,20*log10(X(:,i)),'k');
  	      	title(tit)
   	   	xlabel('Czestotliwosc unormowana: f/fs')
         	ylabel('Amplituda [dB]');
         	axis([-.5 .5 ymin ymax]);
            grid;
            hold on;
         end %if
         pause
      end %if speed
      ii=ii+1;      
   end %for
   grid;
   warning on;
end %if rysuj

X=max(X,10^((ymin+10)/20)); % obciecie bardzo glebokich dolkow
                            % (one BARDZO psuja obrazek w dB)
