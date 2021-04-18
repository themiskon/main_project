function ks=nutrihalsat(p)
%calculates the nutrient half-saturation for different size classes of
%phytplankton (units: μM N)
ix=1:p.Pgrid;
    ks(ix)=0.1*p.xp(ix);
end