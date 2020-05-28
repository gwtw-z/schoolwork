function [ y0 ] = Aitken_zty( X,Y,x0 )
m=length(X);
P=zeros(m,1);
P1=zeros(m,1);
P=Y;
for i=1:m
    P1=P;
    k=1;
    for j=i+1:m
        k=k+1;
  %Neville: P(j)=P1(j-1)+(P1(j)-P1(j-1))*(x0-X(k-1))/(X(j)-X(k-1));
    P(j)=P1(j-1)*(x0-X(j))/(X(k-1)-X(j))+P1(j)*(x0-X(k-1))/(X(j)-X(k-1));
    end
    if abs(P(m)-P(m-1))<10^-6;
        y0=P(m);
        return;
    end
end
y0=P(m);
end