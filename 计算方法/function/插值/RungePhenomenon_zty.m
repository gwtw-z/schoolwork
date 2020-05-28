function RungePhenomenon_zty( )

for i=3:2:11
x=linspace(-5,5,i);
y=1./(1+x.^2);
p=polyfit(x,y,i-1);
xx=-5:0.01:5;
yy=polyval(p,xx);
plot(xx,yy,'--b');
hold on;
grid on;
end;
x=linspace(-5,5);
plot(x,1./(1+x.^2),'r');
fprintf('÷‹ÃÏÒ¥\n');
end

