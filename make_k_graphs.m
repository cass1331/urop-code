function p = make_k_graphs(num_train, rPlay, tz, k_end)
k = 1:100:k_end; for j = 1:(k_end/100), for i = 1:50, r(i,j) = position_decode(num_train, 1000-num_train, rPlay, tz,'mean_residue',k(j)); end; end
r = nan(50,k_end/100);k = 1:100:k_end; for j = 1:(k_end/100), for i = 1:50, r(i,j) = position_decode(num_train, 1000-num_train, rPlay, tz,'correlation',k(j)); end; end
figure
errorbar(k,nanmedian(r), nanstd(r),'ko','capsize',0)
hold on
%f = @(p,t) start + p(1)*(1 - exp(-t/p(2)))
%parm = lsqcurvefit(f,[0.1 10],train,nanmedian(r))
%plot(0:10:1000, f(parm, 0:10:1000),'r')
xlabel('Range of k')
ylabel('Correlation coefficient')