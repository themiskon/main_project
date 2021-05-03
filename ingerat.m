function i0=ingerat(p)
ix=1:p.Zgrid;
i0(ix)=26.*p.xz(ix).^-0.4;
end