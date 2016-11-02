#!/bin/csh
foreach n (50 60 70)
    ratio_jrf.csh cutoff=$n carmap=carma_fluxscale_119.120.map nromap=nro_fluxscale_119.120.map out=ratio_fluxscale_119.120_{$n}.map
    rm -rf ratio_fluxscale_119.120_{$n}.map.fits
    fits in=ratio_fluxscale_119.120_{$n}.map out=ratio_fluxscale_119.120_{$n}.map.fits op=xyout
end
