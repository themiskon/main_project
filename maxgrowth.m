function m0=maxgrowth(p)
for i=1:p.Pgrid
    m0=2.6.*(p.xp(i)).^-0.45;
end