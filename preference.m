%This function calculates the prey preference
%creates a PxZ table. every column contains the preference of different
%zooplankton size classes for one specific phytoplankton size class.
function pref=preference(p)
op=optsize(p);
pref(1:p.Pgrid,1:p.Zgrid)=0;
for i=1:p.Pgrid
    for j=1:p.Zgrid
    pref(i,j)=exp(-((log10(p.xp(i))-log10(op(j)))./p.deltaxP)^2);
    end
end
end

    