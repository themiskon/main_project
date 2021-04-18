[y,p]=projectp
t=1:250 %time 
%p.variable=x %sensitivity test

[t,y] = ode45(@astrocat, t, y, [],p)
