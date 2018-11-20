function beta = position_decode(numFolds, rPlay, t,k)
% @param numFolds number of folds for crossvalidation
% @param rPlay matrix w/neural data
% @param t the t value
% @param k the k value for the ridge regression
% @version 5.1.2018
% this function does a train/test on neural data vs t value (position) and
% returns beta values. Used in position_finder
rng('shuffle');
indices = crossvalind('Kfold', 640, numFolds);
for i = 1:numFolds
   ind_train = find(indices ~= i);
   ind_test = find(indices == i);
   beta = ridge(t(ind_train),rPlay(:,ind_train)',k,0);
end
end

