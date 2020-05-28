function [ value,error_value ] = Problem_3( N,x )
for i=1:2
    for j=1:3
        X=-5:10/N(j):5;
        Y=1./(X.^2+1);
        value(i,j)=LagrangeLine_zty(X,Y,x(i));
        error_value(i,j)=value(i,j)-1/(x(i)^2+1);
    end
end
end

