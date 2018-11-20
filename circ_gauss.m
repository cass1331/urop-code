function y  = circ_gauss(params,x)
% y = cg_dir(x,params(1),params(2),params(3),params(4),params(5));
y = cg(x,params(1),params(2),params(3),params(4),360);

function  y=cg(x,b,a,po,tw,P)
   
    y=zeros(size(x));
    for i=1:length(x(:))
        y(i)=b;
        for j=-4:4
            y(i)=y(i)+a*exp(-(x(i)-po-j*P)^2 / (2*tw^2));
        end
    end
end    

function y=cg_dir(x,b,a1,po,tw,a2)
    y=b*ones(size(x));
    y=y+cg(x,0,a1,po,tw,360);
    y=y+cg(x,0,a2,po+180,tw,360);
end
end