function [y,p]=projectp 
p.N0=0.001;     %initial nutrients μMolN/m^3
p.smallP= 1; % small phytoplankton (μm) ESD Equivalent shperical diameter
p.largeP= 20; %large phytoplankton cell (μm) ESD
p.smallZ= 2; %small zooplankton cells (μm) ESD
p.largeZ= 460; %large zooplankton cell size (μm) ESD
p.Pgrid=20; %No. of phytoplankton size classes
p.Zgrid=20; %No. of zooplankton size classes
p.xp = logspace(log10(p.smallP), log10(p.largeP),p.Pgrid); %size classes for phytoplankton
p.xz = logspace(log10(p.smallZ), log10(p.largeZ),p.Zgrid); %size classes for zooplankton
p.eps=0.3; %Zooplankton assimilation efficiency
p.lP=0.1; %phytoplankton mortality rate
p.feg=0.3; %portion of egested food (unitless)
p.i0=0.5; %maximum ingestion rate (d^-1)
p.deltaxP=0.25; %log(x) units.
p.initP=10^-3*ones(p.Pgrid,1); %initial concentration of P (μMolN/m^3)
p.initZ=10^-3*ones(p.Zgrid,1); %initial concentration of Z (μMolN/m^3)
p.S= 0.06  %external nutrient supply (μMNd^-1)
y=[p.initP; p.initZ; p.N0] ;
%%
%calculating size-depended initial parameters
p.opt=optsize(p);
p.pref=preference(p);
p.m0=maxgrowth(p); %max growth rates for different phytoplankton size
p.ks=nutrihalsat(p); %nutrient half saturation
p.i0=ingerat(p); %maximum ingestion rate
p.Ks=3; %prey half saturation level  (μMolN)
p.zeta=Zmortality(p); %quadratic zooplankton mortality (μΜ^-1d^-1)
end