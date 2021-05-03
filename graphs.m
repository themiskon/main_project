function show=graphs(p,t,y)
    %let's see what we have got!
%Plot 1. feeding preference graph
figure(1)
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
plot(p.xp, p.m0)
xlabel('Phytoplankton size (μm)')
ylabel('max growth rate (day^{-1})')
title('max growth rate for different phytoplankton size classes')

%Plot 3. Phytoplankton concentration through time
figure(3)
surface(t,1:p.Pgrid,y(:,1:p.Pgrid)');
xlabel ('time (years)')
ylabel('Phytoplankton size class')
shading flat
axis([1 length(t) 1 p.Pgrid])
c=colorbar;
c.Label.String = 'Phytoplankton concentration (μMN)';
i=0;
k=length(t);
while k>=365
    i=i+1;
    ys(1,i)=i;
    k=k-365;
end
o=5:5:length(ys);
xticks(o'.*365);
xticklabels({o});
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
surface(t,p.Pgrid+1:p.Pgrid+p.Zgrid,y(:,p.Pgrid+1:p.Pgrid+p.Zgrid)');
xlabel ('time (years)')
ylabel('Zooplankton size class')
xticks(o'.*365);
yticks(p.Pgrid+1:p.Pgrid+p.Zgrid);
yticklabels({1:p.Zgrid});
xticklabels({o});
shading flat
c=colorbar;
c.Label.String = 'Zooplankton concentration (μMN)';
axis([1 length(t) p.Pgrid+1 p.Pgrid+p.Zgrid])

%Plot 5. Nutrient concentration through time
figure(5)
plot(t,y(:,end))
xticks(o'.*365);
xticklabels({o});
xlabel('time (years)')
ylabel('nutrient concentration (μMN)')

%Plot 6. Size classes
figure(6)
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
end
