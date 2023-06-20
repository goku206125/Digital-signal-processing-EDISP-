function LCPS_spectrogram(X, f, n, lin)
%function spectrog(X,f,n,lin)
% wykresla spektrogram obliczony przez [X,f,n]=swifft(.....)
% w skali pionowej: logarytmicznej, lub liniowej jesli jest parametr 'lin'


[mrows ncols]=size(X);
N=6;
if nargin < 4 ,
   X=20*log10(abs(X(mrows:-1:1,:)));
else
   if ~isstr(lin) ,
      N=lin;
   else
      N=6;
   end %if
   X=X(mrows:-1:1,:);
end %if
%dziwne indeksowanie ma poprawic blad w funkcji matlabowskiej CONTOUR

figure;
contour(n,f,X,N);
title('Spektrogram')
xlabel('Numer próbki');
ylabel('Czêstotliwoœæ unormowana: f/fs');

figure;
imagesc(X);
child=get(gcf, 'children');
set(child,'YLim', [1 mrows],'YTick',linspace(1,mrows-1,11), 'YTickLabel', [-0.5:0.1:0.5]');
title('Spektrogram')
xlabel('Numer próbki');
ylabel('Czêstotliwoœæ unormowana: f/fs');

colorbar


