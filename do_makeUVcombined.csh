#! /bin/csh -f
#set uvselect = "uvrange(6,1000.0)"
set uvflag = 1
set nroorg = /net/arce/jrf57/13co/13CO_20161011_FOREST-BEARS_xyb_spheroidal_dV0.11kms_YS
set nroparams = /net/arce/jrf57/miriad-imaging/nroParams_jrf_tintnro0.01.csh
set makeImage = 1
set remakeBeam = 1
set caruv = /net/arce/jrf57/vis/13co/orion.D.narrow.mir,/net/arce/jrf57/vis/13co/orion.E.narrow.mir
set carmap = 'carma_full_119.120.map'
set carbeam = 'carma_full_119.120.beam'

set cell = 1
set imsize = 257
set robust = 2

set nrod = "nro/13co_tintnro0.01_testregion"
set source = "(omc31,omc32,omc33,omc41,omc42,omc43,omc52,omc53,omc54)"

source makeUVcombined_jrf.csh carmap=$carmap carbeam=$carbeam \
makeImage=$makeImage cell=$cell imsize=$imsize robust=$robust uvflag=$uvflag nroorg=$nroorg \
nroparams=$nroparams caruv=$caruv nrod=$nrod source=$source

