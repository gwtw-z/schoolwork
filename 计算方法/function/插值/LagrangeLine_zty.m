function [ value ] = LagrangeLine_zty( X,Y,x0 )

m=length(X);
for j=1:m-1
    if x0>=X(j) && x0<=X(j+1)
        p=polyfit([X(j),X(j+1)],[Y(j),Y(j+1)],1);
        value=polyval(p,x0);
        return
    end
end
end

