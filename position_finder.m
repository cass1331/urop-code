function pred = position_finder(varargin)
% This function is used for ...
% Getting centroid/t-value predicted from neural data
% pred = position_finder(varargin);
% @param beta_hori the regression between the horizontal t value and the
% neural data
% @param beta_vert the regression between the vertical t value and the
% neural data
% @param rPlay the neural data
% @param p slope and intercept between t value and centroids
% @version 5.1.2018

p = inputParser;
p.addParameter('beta_hori', [], @isnumeric);
p.addParameter('beta_vert', [], @isnumeric);
p.addParameter('rPlay', [], @isnumeric);
p.addParameter('parm', [], @isstruct);
p.addParameter('type', [], @isstr);
p.parse(varargin{:});
beta_hori = p.Results.beta_hori;
beta_vert= p.Results.beta_vert;
rPlay= p.Results.rPlay;
parm= p.Results.parm;
type= p.Results.type;



pred_hori = beta_hori(1) + beta_hori(2:end)'*rPlay(:,:);
pred_vert = beta_vert(1) + beta_vert(2:end)'*rPlay(:,:);
cent_est = cent_estimate(pred_hori, pred_vert, parm);
switch(type)
    case 'iscentroid'
        pred = cent_est;
    case 'tvalue'
        pred = horzcat(pred_hori', pred_vert');
end
end
