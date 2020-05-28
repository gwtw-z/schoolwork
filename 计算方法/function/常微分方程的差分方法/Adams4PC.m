function A = Adams4PC( f,a,b,N,ya )

if N<4 
    return;
end
h=(b-a)/N;
x=zeros(1,N+1);
y=zeros(1,N+1);
x=a:h:b;
y(1)=ya;
F=zeros(1,4);
for i=1:N
    if i<4
         k1=feval(f,x(i),y(i));
         k2=feval(f,x(i)+h/2,y(i)+k1*h/2);
         k3=feval(f,x(i)+h/2,y(i)+k2*h/2);
         k4=feval(f,x(i)+h,y(i)+k3*h);
         y(i+1)=y(i)+(k1+2*k2+2*k3+k4)*h/6;
    else
        for j=1:4
                F(j)=feval(f,x(i-4+j),y(i-4+j));
        end
        py=y(i)+F*[-9,37,-59,55]'*h/24;
        p=feval(f,x(i+1),py);
        F=[F(2) F(3) F(4) p];
        y(i+1)=y(i)+F*[1,-5,19,9]'*h/24;
    end
end
A=[x',y'];   

end

