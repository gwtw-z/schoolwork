function S = FSimpson_zty( f,a,b,N )

h=(b-a)/N;
fa=feval(f,a);
fb=feval(f,b);
S=fa+fb;
x=a;
for i=1:N-1
    x=x+h/2;
    fx=feval(f,x);
    S=S+4*fx;
    x=x+h/2;
    fx=feval(f,x);
    S=S+2*fx;
end
S=S+4*feval(f,x+h/2);
S=h*S/6;
end

