function [ y0,N ] = Lagrange_zty( X,Y,x0 )
m=length(X);
N=zeros(m,1);
y0=0;
for i=1:m
    N(i)=1;
    for j=1:m
        if j~=i
            N(i)=N(i)*(x0-X(j))/(X(i)-X(j));
        end
    end
    y0=y0+Y(i)*N(i);
end
end

