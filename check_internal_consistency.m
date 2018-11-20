function [isReliable,intcon] = check_internal_consistency(rate, num_trials, cutoff)
%Use: checks the internal consistency / reliability of a neuron wrt to a 
% certain set of stimuli
%INPUT: 
%rate: [matrix] reps x stimuli for one neuron
%num_trials: [int] number of trials to run
%cutoff: [double] between 0 and 1, where to decide if the neuron is consistent or
%not
%
%OUTPUT: 
%is_reliable: [logical] if the neuron is consistent or not based on cutoff
%intcon: [double] average correlation of neuron to itself

r = nan(1, num_trials);

for i = 1:num_trials
    indices_one = randsample(1:size(rate,1),size(rate,1)/2);
    indices_two = setdiff(1:size(rate,1),indices_one);
    rate_one = nanmean(rate(indices_one,:));
    rate_two = nanmean(rate(indices_two,:));
    check = corr(rate_one', rate_two', 'type', 'Spearman');
    r(i) = check;
end
 r= spearmanBrownCorrection_splithalf(r);
isReliable = (nanmean(r) > cutoff);
intcon = nanmean(r);

function r_corrected = spearmanBrownCorrection_splithalf(r)
% This is the spearman brown correction function
    r_corrected = 2*r./(1+r);
end


end