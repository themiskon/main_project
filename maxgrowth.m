function m0=maxgrowth(p)
ix=1:p.Pgrid;
    m0(ix)=2.6.*(p.xp(ix).^-0.45); %(1/day * size/size)
end