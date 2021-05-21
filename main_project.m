%Variables + time definition
[yi,p]=projectp;
t=1:365*30; %time (days)

%%
%sensitivity test
g=30; %
%p.z= logspace(log10(0.06), log10(4),g) ; %min and max values of parameter
p.z=linspace(0.06,4,g);
%p.z=[0.03 0.05 0.10 0.15 0.20];
yy=struct;
disp('running sensitivity test')
for i=1:g
p.S= p.z(i);
if exist('g','var')
    [t,y] = ode45(@astrocat, t, yi, [],p);
    yy.(sprintf('case%d',i))=y;
%p=depended(p) %calculate size depended parameters
else
    %%
disp('running the model')

[t,y] = ode45(@astrocat, t, yi, [],p);
end
end
%%
disp('plotting')
graphs(p,t,yy.case30);
%%
%statistics
statistics(p,t,yy,g)
