function E = Euler( f,a,b,N,ya )

h=(b-a)/N;
y=zeros(1,N+1);
x=zeros(1,N+1);
y0=zeros(1,N+1);
y(1)=ya;
x=a:h:b;
for i=1:N
    y(i+1)=y(i)+h*feval(f,x(i),y(i));
end
E=[x',y'];