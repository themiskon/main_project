function show=graphs(p,t,y)
    %let's see what we have got!
    k=length(t);
    i=0;
while k>=365
    i=i+1;
    ys(1,i)=i;
    k=k-365;
end
o=5:5:length(ys);
%%
%Plot 1. feeding preference graph
figure(1)
clf
h=gca;
surface(p.xz,p.xp,p.pref);
xlabel ('Zooplankton Size (μm)');
ylabel ('Phytoplankton Size (μm)');
zlabel ('Prey preference');
title('Grazer selectivity');
set(h,'yscale','log');
set(h,'xscale','log');
axis([p.smallZ p.largeZ p.smallP p.largeP]);
xticks([2 20 200]);
xticklabels({'2','20','200'});
yticks([1 2 5 10 20]);
yticklabels({'1','2','5','10','20'});
c = colorbar;
c.Label.String = 'Prey preference';
shading interp;
c = gray;
c = flipud(c);
colormap(c);

%Plot 2. Max growth rate of phytoplankton size classes
figure(2)
clf
plot(p.xp, p.m0)
xlabel('Phytoplankton size (μm)')
ylabel('max growth rate (day^{-1})')
title('phytoplankton max growth rate')

%Plot 3. Phytoplankton concentration through time
figure(3)
clf
h=gca;
surface(t,p.xp,y(:,1:p.Pgrid)');
xlabel ('time (years)')
ylabel('Phytoplankton size (μm)')
axis([1 length(t) p.smallP p.largeP])
c=colorbar;
c.Label.String = 'Phytoplankton concentration (μMN)';
xticks(o'.*365);
xticklabels({o});
 set(h,'yscale','log');
 yticks([1 2 5 10 20]);
yticklabels({'1','2','5','10','20'});
 shading flat;

                                                                    
                                                                          
%                                 █████                                  
%                               █         █                                
%                             █▒▒▒        █                              
%                           █▒▒▒       ▒▒█                           
%                           █▒▒▒▒      ▒▒█                            
%                         █  ▒▒▒▒     ▒▒▒█                          
%                         █                ▒▒█                          
%                       █▒        ▒▒▒       █                        
%                       █        ▒▒▒▒▒      █                        
%                       █        ▒▒▒▒▒   ▒▒█                        
%                       █▒      ▒▒▒▒▒   ▒▒█                        
%                         █▒▒    ▒▒▒     ▒▒█                          
%                         █▒▒             ▒▒█                         
%                           █▒▒            █                            
%                             ██        ██                              
%                                 ████     

%Plot 4. Zooplankton concentration through time
figure(4)
clf
h=gca;
surface(t,p.xz,y(:,p.Pgrid+1:p.Pgrid+p.Zgrid)');
xlabel ('time (years)')
ylabel('Zooplankton size (μm)')
xticks(o'.*365);
yticks([2 20 200]);
yticklabels({'2','20','200'});
xticklabels({o});
set(h,'yscale','log');
shading flat
c=colorbar;
c.Label.String = 'Zooplankton concentration (μMN)';
axis([1 length(t) p.smallZ p.largeZ])

%Plot 5. Nutrient concentration through time
figure(5)
clf
plot(t,y(:,end))
xticks(o'.*365);
xticklabels({o});
xlabel('time (years)')
ylabel('nutrient concentration (μMN)')

%Plot 6. Size classes
figure(6)
clf
tiledlayout(2,1)
nexttile
bar(1:p.Pgrid,p.xp)
xlabel('phytoplankton size class')
ylabel('ESD (μm)')
nexttile
figure(6)
bar(1:p.Zgrid,p.xz)
xlabel('zooplankton size class')
ylabel('ESD (μm)')

%plot 7. Zooplankton mortality rate
figure(7)
clf
h=gca;
plot(p.xz,p.zeta)
set(h,'xscale','log');
xticks([2 20 200]);
xticklabels({'2','20','200'});
xlabel('Zooplankton size (μm)')
ylabel('Mortality rate ((μMN)^{-1}d^{-1})')
title('Zooplankton mortality rate')

figure(8)
clf
y(y<0)=0;
boxplot(log10(y(15*365+1:end,1:p.Pgrid)),p.xp)
% fmt = xtickformat
% xtickformat('%.2f')

%total concentration
figure(9)
clf 
xp=y(5*365+1:end,1:p.Pgrid);
xz=y(5*365+1:end,p.Pgrid+1:p.Pgrid+p.Zgrid);
sumxp=sum(xp,2);
sumxz=sum(xz,2);
tiledlayout(3,1)
nexttile
plot(t(5*365+1:end),sumxp)
ylabel('P. concentration (μMN)')
title('Total phytoplankton concentration')
xticks(o'.*365);
xticklabels({});
nexttile
plot(t(5*365+1:end),sumxz)
ylabel('Z. concentration (μMN)')
title('Total zooplankton concentration')
xticks(o'.*365);
xticklabels({});
nexttile
plot(t(5*365+1:end),y(5*365+1:end,end))
xlabel('time (years)')
ylabel('N. concentration (μMN)')
title('Nutrient concentration')
xticks(o'.*365);
xticklabels({o});
end
