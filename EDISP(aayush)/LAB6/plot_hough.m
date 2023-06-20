
function plot_hough(H,T,R)
  
  is_hold = ishold;
  
  imagesc(T,R,H), xlabel('\theta'), ylabel('\rho'), axis on, axis normal;
  
  if ~is_hold
    hold on;
  end
  
  P = houghpeaks(H,9,'threshold',ceil(0.1*max(H(:))));
  x = T(P(:,2));
  y = R(P(:,1));
  plot(x, y, 'o', 'color', 'white');
  
  if ~is_hold
    hold off
  end
end
