function dydt=astrocat(t,y,p)
P = y(1:p.Pgrid);
Z = y(p.Pgrid+1:p.Pgrid+p.Zgrid);
N = y(end);

%preference of Z for prey P
%p.pref


%grazing
 for i=1:p.Pgrid
%     for j=1:p.Pgrid
 grazP(i,:)=p.i0.*((p.pref(i,:).*P(i)).*Z(:)')/(p.Ks+sum(p.pref(i,:).*P(i)));
end
 for i=1:p.Zgrid
 grazZ(:,i)=p.i0(i).*(p.pref(:,i).*P(:)).*Z(i)/(p.Ks+sum(p.pref(:,i).*P(:)));
 end
% for i = 1:p.Pgrid
% for j = 1:p.Pgrid
% for j = 1:Pgrid
% total = sum(phi(:,j).*P)
% for i = 1:Pgrid
% graz(i,j) = I0(j)…/(Ks + total(j)) * Z(j)
% end
% end


dPdt=zeros(p.Pgrid,1);
dZdt=zeros(p.Zgrid,1);
for i=1:p.Pgrid
dPdt(i)= p.m0(i)*(N/(p.ks(i)+N))*P(i)-sum(grazP(i,:))-p.lP*p.m0(i)*P(i);
end
for i=1:p.Zgrid
    dZdt(i)= p.eps.*sum(grazZ(:,i))-p.zeta(i).*Z(i).*sum(Z);
end

dNdt= p.S-sum(p.m0.*P'.*(N./(p.ks+N)))+(1-p.eps-p.feg).*sum(sum(grazZ));
dydt=[dPdt; dZdt; dNdt];
end