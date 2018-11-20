function y = fit_gaussian(rate, stim, init_guess)
%Use: plots gaussian best fit func + neural data points with errorbars
%
%INPUT:
%rate: [matrix] reps x stimuli for one neuron
%stim: [matrix] array of possible stimuli for one neuron
%init_guess: [matrix] 1x4 matrix of gaussian params, initial guess
%
%OUTPUT:
%
%y: [matrix] expected firing rates estimate



p = lsqcurvefit(@circ_gauss,init_guess,stim,nanmean(rate));
y = circ_gauss(p,linspace(0,stim(end),8));
err = nanstd(rate)/(sqrt(size(rate,1)));
figure()
errorbar(stim,nanmean(rate),err, 'o', 'capsize', 0)
hold on;
plot(linspace(0,stim(end),8),y)
end