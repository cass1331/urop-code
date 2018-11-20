wchfor i = 1:26
beta_vert = position_decode(4, rates_nano(:,:,i), tz, 500);
beta_hori = position_decode(4, rates_nano(:,:,i), ty, 500);
t_pred = position_finder(beta_hori, beta_vert, rates_nano(:,:,i), p, 'tvalue');
t_corr(i,:) = position_corr(tz, t_pred(:,2), ty, t_pred(:,1));

end