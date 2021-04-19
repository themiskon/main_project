[y,p]=projectp
t=1:250; %time 
%p.variable=x %sensitivity test

%p=depended(p) %calculate the size depended parameters

%%
%let see what we have got!
%Plot 1. feeding preference graph
figure (5)

surface(p.xz,p.xp,p.pref)
shading interp
colormap gray
%%
h=gca
surface(p.xz,p.xp,p.pref);
xlabel ('Zooplankton Size (μm)');
ylabel ('Phytoplankton Size (μm)');
zlabel ('Prey preference');
title('Grazer selectivity');
set(h,'yscale','log')
set(h,'xscale','log')
axis([p.smallZ p.largeZ p.smallP p.largeP])
xticks([2 20 200])
xticklabels({'2','20','200'})
yticks([1 2 5 10 20])
yticklabels({'1','2','5','10','20'})
c = colorbar;
c.Label.String = 'Prey preference';
shading interp
colormap gray
%%
%[t,y] = ode45(@astrocat, t, y, [],p)
