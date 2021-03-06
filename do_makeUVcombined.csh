#! /bin/csh -f
#set uvselect = "uvrange(6,1000.0)"
set uvflag = 1
set nroorg = ../13co/13CO_20161011_FOREST-BEARS_xyb_spheroidal_dV0.11kms_YS
set nroparams = nroParams_jrf.csh
set makeImage = 0
set remakeBeam = 1
set caruv = ../../calibrate/merged/13co/orion.D.narrow.mir,../../calibrate/merged/13co/orion.E.narrow.mir
#set caruv = /net/arce/jrf57/vis/13co/orion.D.narrow.mir,/net/arce/jrf57/vis/13co/orion.E.narrow.mir
set carmap = 'carma_full_30.190.map'
set carbeam = 'carma_full_30.190.beam'

set cell = 1.0
set imsize = 257
set robust = 0.5

set nrod = "nro/13co_full_30.190"
#set source = ""

source makeUVcombined_jrf.csh carmap=$carmap carbeam=$carbeam \
makeImage=$makeImage cell=$cell imsize=$imsize robust=$robust uvflag=$uvflag nroorg=$nroorg \
nroparams=$nroparams caruv=$caruv nrod=$nrod# source="$source"

