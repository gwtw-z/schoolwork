function R = Rungkuta4( f,a,b,N,ya )

h=(b-a)/N;
y=zeros(1,N+1);
x=zeros(1,N+1);
y(1)=ya;
x=a:h:b;
for i=1:N
    k1=feval(f,x(i),y(i));
    k2=feval(f,x(i)+h/2,y(i)+k1*h/2);
    k3=feval(f,x(i)+h/2,y(i)+k2*h/2);
    k4=feval(f,x(i)+h,y(i)+k3*h);
    y(i+1)=y(i)+(k1+2*k2+2*k3+k4)*h/6;
end
R=[x',y'];

end

