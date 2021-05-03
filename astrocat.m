function dydt=astrocat(t,y,p)
P = y(1:p.Pgrid);
Z = y(p.Pgrid+1:p.Pgrid+p.Zgrid);
N = y(end);
ix=1:p.Pgrid;
total(ix)=sum(p.pref(ix,:).*P(ix));
graz(1:p.Pgrid,1:p.Zgrid)=0;
for i=1:p.Pgrid
    for j=1:p.Zgrid
        graz(i,j)=p.i0(j)*(p.pref(j,i)*P(i))/(p.Ks+total(i))*Z(j);
    end
end
    
dPdt=zeros(p.Pgrid,1);
dZdt=zeros(p.Zgrid,1);
for i=1:p.Pgrid     
dPdt(i)= p.m0(i)*(N/(p.ks(i)+N))*P(i)-sum(graz(i,:))-p.lP*p.m0(i)*P(i);
end
for i=1:p.Zgrid
    dZdt(i)= p.eps*sum(graz(:,i))-p.zeta(i)*Z(i)*sum(Z);
end

dNdt= p.S-sum(p.m0.*P'.*(N./(p.ks+N)))+(1-p.eps-p.feg).*sum(sum(graz));
dydt=[dPdt; dZdt; dNdt];
end