%This function calculates the prey preference
%creates a PxZ table. every column contains the preference of different
%zooplankton size classes for one specific phytoplankton size class.
function pref=preference(p)
op=optsize(p);
for i=1:p.Zgrid
    pref(i,:)=exp(-(log(p.xp)-log(op(i))./p.deltaxP).^2);
end
end

    