%This function calculates the prey preference
%creates a PxZ table. every column contains the preference of different
%zooplankton size classes for one specific phytoplankton size class.
function pref=preference(p)
for i=1:p.Pgrid
    pref(:,i)=exp(-((log(p.xp(i))-log(optsize(p))./p.deltaxP).^2));
end
    