[y,p]=projectp;
t=1:365*30; %time (days)
%p.variable=x %sensitivity test

%p=depended(p) %calculate the size depended parameters
%%
disp('running the model')
[t,y] = ode45(@astrocat, t, y, [],p);
%%
disp('plotting')
graphs(p,t,y);