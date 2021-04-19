function m0=maxgrowth(p)
for i=1:p.Pgrid
    m0(i)=2.6.*(p.xp(i)).^-0.45; %(1/day * size/size)
end