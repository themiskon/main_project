[y,p]=projectp;
t=1:365*30; %time (days)
%p.variable=x %sensitivity test

%p=depended(p) %calculate size depended parameters
%%
disp('running the model')
[t,y] = ode45(@astrocat, t, y, [],p);
%%
disp('plotting')
graphs(p,t,y);

%%
%total population 
xp=y(:,1:p.Pgrid);
xz=y(:,p.Pgrid+1:p.Pgrid+p.Zgrid);
sumxp=sum(xp,2);
sumxz=sum(xz,2);
figure(10)
tiledlayout(3,1)
nexttile
plot(t,sumxp)
nexttile
plot(t,sumxz)
nexttile
plot(t,y(:,end))