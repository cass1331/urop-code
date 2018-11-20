function p = make_training_graphs(num_train, rPlay, tz, k, start)
train = [100: 100: num_train]; for j = 1:(num_train/100), for i = 1:50, r(i,j) = position_decode(train(j), 1000-num_train, rPlay, tz,'mean_residue',k); end; end
r = nan(50,num_train/100);train = [100: 100: num_train]; for j = 1:(num_train/100), for i = 1:50, r(i,j) = position_decode(train(j), 1000-num_train, rPlay, tz,'correlation',k); end; end
figure
errorbar(train,nanmedian(r), nanstd(r),'ko','capsize',0)
hold on
f = @(p,t) start + p(1)*(1 - exp(-t/p(2)))
parm = lsqcurvefit(f,[0.1 10],train,nanmedian(r))
plot(0:10:1000, f(parm, 0:10:1000),'r')
xlabel('Number of training images')
ylabel('Correlation coefficient')