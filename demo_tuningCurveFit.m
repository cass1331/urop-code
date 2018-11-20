 %% Make an initial guess
 
 int_guess = [20 20 100 40];
 %% Directions 
 
 dir = [0 45 90 135 180 215 270 315];
 
 %% Curvefit
r = squeeze(rate.dots.nano.it(:,5,:));
 
 p = lsqcurvefit(@circ_gauss,int_guess,dir,nanmean(r));
 yFit = circ_gauss(p,linspace(0,315,100));
 %% plot this would entail 
 
  plot(dir,nanmean(r),'o');
  hold on;
  plot(linspace(0,315,100),yFit);