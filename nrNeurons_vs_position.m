
function err = nrNeurons_vs_position(r,nrNeurons,tz,ty)

err_z = nan(50,1);
err_y = nan(50,1);
err = nan(50,1);

for i = 1:50
    rng(i,'twister');
    train = randsample(size(r,2),round(0.9*size(r,2)),false);
    test  = ~ismember(1:size(r,2),train);
    loc = randsample(size(r,1),nrNeurons,false);
    
    b = ridge(tz(train), r(loc,train)', 500,0);
    pred_tz = b(2:end)'*r(loc,test)+b(1);
    
    b = ridge(ty(train), r(loc,train)', 500,0);
    pred_ty = b(2:end)'*r(loc,test)+b(1);
    
    err(i) = nanmean([immse(pred_tz',tz(test)),immse(pred_ty',ty(test))]);
    err_z(i) = immse(pred_tz',tz(test));
    err_y(i) = immse(pred_ty',ty(test));
    
end

