function root = Chord( f,x0,x1,emg )
y0=feval(f,x0);
y=feval(f,x1);
while abs((x1-x0)*y/(y-y0))>emg
    y=feval(f,x1);
    x1=x1-(x1-x0)*y/(y-y0);
end
root=x1;
end