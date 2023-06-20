function plot_lines(L)

if isempty(L)
    return;
end

is_hold = ishold;

for k = 1
  xy = [L(k).point1; L(k).point2];
  plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
  
  plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
  plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end
   
if length(L) == 1
    return
end

if ~is_hold
    hold on;
end

for k = 1:length(L)
  xy = [L(k).point1; L(k).point2];
  plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
  
  plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
  plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end

if ~is_hold
    hold off
end