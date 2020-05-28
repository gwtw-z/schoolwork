function x0 = Aitken( f,x0 )
temp=x0;
x1=feval(f,x0);
x2=feval(f,x1);
x0=x2-(x1-x2)^2/(x2-2*x1+x0);
while abs(temp-x0)>10^-4
    temp=x0;
    x1=feval(f,x0);
    x2=feval(f,x1);
    x0=x2-(x1-x2)^2/(x2-2*x1+x0);
end
end

