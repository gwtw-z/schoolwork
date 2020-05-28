function S = FTrapezoid_zty( f,a,b,n )

S=0;
for i=0:n-1
    S=S+2*feval(f,a+i*(b-a)/n);
end
S=(b-a)*(S+feval(f,a)+feval(f,b))/(2*n);

end

