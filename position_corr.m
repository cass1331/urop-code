function t_corr = position_corr(tz, tz_pred, ty, ty_pred)
% @param tz the vertical t value
% @param tz_pred the predicted vertical t value from the neural data
% @param ty the horizontal t value
% @param ty_pred the predicted horizontal t value from the neural data
% @version 5.1.2018
% gets Spearman correlation constant between t value and predicted t value
r_hori = corr(ty, ty_pred,'Type', 'Spearman');
r_vert = corr(tz, tz_pred,'Type', 'Spearman');
t_corr = [r_hori r_vert];
end
