function stat=statistics(p,t,yy,g)
%proportion trends
for i=1:g
y=yy.(sprintf('case%d',i));
xp=y(5*365+1:end,1:p.Pgrid);
avxp=mean(xp);
meanP(i,:)=avxp;
xz=y(5*365+1:end,p.Pgrid+1:p.Pgrid+p.Zgrid);
avxz=mean(xz);
meanZ(i,:)=avxz;
size=[p.Pgrid; p.Zgrid];
N=y(5*365+1:end,end);
meanN(i,:)=mean(N);
sumxp=sum(xp,2);
sumxz=sum(xz,2);
percP=xp./sumxp;
perxZ=xz./sumxz;
meanPP(i,:)=mean(percP);
meanPZ(i,:)=mean(perxZ);
end
meanTP=sum(meanP,2);
meanTZ=sum(meanZ,2);





%average concentration for different nutrient inflow rates.
figure(15)
clf
tiledlayout(1,2)
nexttile
surface(p.z,p.xp,meanP');
h=gca;
set(h,'yscale','log')
set(gca,'fontsize', 18);
colorbar
yticks([1 2 5 10 20]);
yticklabels({'1','2','5','10','20'});
xticks([0.03 0.05 0.10 0.15 0.20]);
xticklabels({'0.03','0.05','0.1','0.15','0.20'});
xlabel('Phytoplankton mortality factor')
ylabel('Size (μm)')
axis([0.03 0.20 p.smallP p.largeP])
shading flat
nexttile
surface(p.z,p.xz,meanZ');
h=gca;
set(h,'yscale','log')
xlabel('Phytoplankton mortality factor')
%ylabel('Zooplankton size (μm)')
c = colorbar;
c.Label.String = 'mean concentration (mMN)';
c.FontSize=18;
h=gca;
set(h,'yscale','log')
set(gca,'fontsize', 18);
axis([0.03 0.20 p.smallZ p.largeZ])
yticks([2 20 200]);
yticklabels({'2','20','200'});
xticks([0.03 0.05 0.10 0.15 0.20]);
xticklabels({'0.03','0.05','0.1','0.15','0.20'});
shading flat

%Change in mean total phytoplankton and zooplankton biomass and nutrient
%concentration
figure(16)
clf
plot(p.z, meanTP)
hold on
plot(p.z, meanTZ)
plot(p.z,meanN)
xlabel('Nutrient input (μMNd^{-1})')
ylabel('Total concentration (μΜΝ)')
legend('Phytoplankton','Zooplankton','Nutrients')

%fitting curves
%phyto
fit = polyfit(p.z,meanTP,1)
pfit=polyval(fit,p.z);
yresid = meanTP' - pfit;
SSresid = sum(yresid.^2);
SStotal = (length(meanTP)-1) * var(meanTP);
rsqP = 1 - SSresid/SStotal

%Zoo
fitZ=polyfit(p.z,meanTZ,1)
pfitZ=polyval(fitZ,p.z);
yresidZ = meanTZ' - pfitZ;
SSresidZ = sum(yresidZ.^2);
SStotalZ = (length(meanTP)-1) * var(meanTP);
rsqZ = 1 - SSresidZ/SStotalZ



%percentage of size classes
figure(17)
clf
tiledlayout(1,2)
nexttile
surface(p.z,p.xp,meanPP');
h=gca;
set(h,'yscale','log')
set(gca,'fontsize', 18);
colorbar
yticks([1 2 5 10 20]);
yticklabels({'1','2','5','10','20'});
xlabel('Nutrient input (μMNd^{-1})')
ylabel('Size (μm)')
axis([0.06 4 p.smallP p.largeP])
shading flat
nexttile
surface(p.z,p.xz,meanPZ');
h=gca;
set(h,'yscale','log')
xlabel('Nutrient input (μMNd^{-1})')
%ylabel('Zooplankton size (μm)')
c = colorbar;
c.Label.String = 'percentage (%) of total biomass';
c.FontSize=18;
h=gca;
set(h,'yscale','log')
set(gca,'fontsize', 18);
axis([0.06 4 p.smallZ p.largeZ])
yticks([2 20 200]);
yticklabels({'2','20','200'});
shading flat
end

