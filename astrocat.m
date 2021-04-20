function dydt=astrocat(t,y,p)
P = y(1:p.Pgrid);
Z = y(p.Pgrid+1:p.Pgrid+p.Zgrid);
N = y(end);

%preference of Z for prey P
%p.pref


%grazing
% for i=1:p.Pgrid
%     for j=1:p.Pgrid
% grazP(i)=p.i0*(p.pref(i,:).*P(i))/(p.Ks+sum(p.pref(i,:).*P(i)));
% end
% for i=1:p.Pgrid
% grazZ(i)=p.i0*(p.pref(:,i).*P(i))/(p.Ks+sum(p.pref(:,i).*P(i)));
% end
for i = 1:p.Pgrid
for j = 1:p.Pgrid
for j = 1:Pgrid
total = sum(phi(:,j).*P)
for i = 1:Pgrid
graz(i,j) = I0(j)…/(Ks + total(j)) * Z(j)
end
end


dPdt=zeros(p.Pgrid,1);
dZdt=zeros(p.Zgrid,1);
for i=1:p.Pgrid
dPdt(i)= p.m0(i)*(N/(param.k+N))*P(i)-sum(graz(i))-p.lP*p.m0(i)*P(i);
end
for i=1:p.Zgrid
    dZdt(i)= p.eps*grazZ(i)-p.zeta*Z*Ztotal;



dNdt= p.S-sum(param.m0*(N/(p.k+N))*P)+(1-p.eps-p.feg)*sum(graz);
end