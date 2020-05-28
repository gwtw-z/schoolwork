function root = Newton( x0 )

f=@(x)x^3-3*x-1;
f1=@(x)3*x^2-3;
X(1)=x0;
X(2)=X(1)-feval(f,X(1))/feval(f1,X(1));
i=2;
while abs(X(i)-X(i-1))>10^-5
    X(i+1)=X(i)-feval(f,X(i))/feval(f1,X(i));
    i=i+1;
end
root=X(i);

end

