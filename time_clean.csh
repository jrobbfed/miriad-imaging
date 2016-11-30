#! /bin/csh -f
#Use miriad-4.3.9 
#source miriad_64/miriad_start.csh
#
set niter=10000000
set run_invert = 1
set algorithm = "mossdi2"
#se1 vis = "nro/13co/carma_uv_full_171.172_scalefactor.mir,nro/13co/13co.uv_full_171.172_scalefactor.all"
#set vis = "nro/13co/carma_uv_42_171.172_scalefactor.mir,nro/13co/13co.uv_42_171.172_scalefactor.mir"

#set carvis = "nro/13co/carma_carmacell0.5_uv6to1000_nrobm16_imsize200.mir"
#set nrovis = "nro/13co/13co.carmacell1_uv6to1000_nrobm16_imsize200.all"
set carvis = "nro/13co_full/carma_uv.mir"
set nrovis = "nro/13co_full/13co.uv.all"
#set carvis = "nro/13co/carma_carmacell1_uv6to1000_nrobm16.mir"
#set nrovis = "nro/13co/13co.carmacell1_uv6to1000_nrobm16.all"

#set vis = "nro/13co/13co.carmacell1_uvall.all,nro/13co/carma_carmacell1_uvall.mir2"
#set vis = "nro/13co/carma_uv6to1000_42_171.172_scalefactor.mir,nro/13co/13co.uv6to1000_42_171.172_scalefactor.all"
#set vis = "nro/13co/13co.uvall_42_171.172_scalefactor.all"
#set dirty_name = 'carmaonly_noscalefactor'
#set dirty_name = 'omc_full_mosaic.double.systemp_171.172'
#set dirty_name = 'combined_cell1rob2_uv6to1000_nrobm16_not10m10m'
set dirty_name = 'combined_119.120_full_newNRO_robust2'
#set source = ''
set robust = 2
set cell = 1
set imsize = 257 
set run_mkmask = 1
set mkmask_dummy = 1
set run_restart = 0
set restart_channel = 1
set run_clean = 1
set run_restor = 1
set cutoff = 5
set gain = 0.1
set polygon_region = 'nro_region.txt'
#set polygon_region = 'box_small.txt'
#set polygon_region = 'box_north.txt'
#set polygon_region = '42_region.txt'
set region_limit = 0
set options="double,systemp,mosaic"
set different_beam = 0
set use_psf_as_beam = 0
set remove_baselines = 0 
#set use_which_antennas = 0 
#set select = "dec(-8,-05:25)"
#set options="mosaic"

#Remove baselines from CARMA vis and combine with NRO vis file,
rm -rf cartmp.mir
rm -rf cartmp2.mir
rm -rf cartmp3.mir
#set remove_baselines = "10m10m"
if ($remove_baselines == "10m10m") then 
	uvcat vis=$carvis out="cartmp.mir" select="-ant(1,2,3,4,5,6)(1,2,3,4,5,6)"
	set carvis = "cartmp.mir"
endif
#set remove_baselines = "6m10m"
if ($remove_baselines == "6m10m") then 
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(7,8,9,10,11,12,13,14,15)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(7,8,9,10)"
	uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(11,12,13,14,15)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(11,12,13)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(15)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(7)"
	set carvis = "cartmp2.mir"
endif
#set remove_baselines = "6m6m"
if ($remove_baselines == "6m6m") then 
	uvcat vis=$carvis out="cartmp3.mir" select="-ant(7,8,9,10,11,12,13,14,15)(7)"
	set carvis = "cartmp3.mir"
endif

#set vis = $carvis,$nrovis
set vis = $carvis,$nrovis

time images_line_isella.csh imsize=$imsize niter=$niter gain=$gain run_mkmask=$run_mkmask mkmask_dummy=$mkmask_dummy run_restart=$run_restart cutoff=$cutoff polygon_region=$polygon_region restart_channel=$restart_channel run_invert=$run_invert run_clean=$run_clean run_restor=$run_restor robust=$robust vis=$vis dirty_name=$dirty_name options=$options region_limit=$region_limit different_beam=$different_beam use_psf_as_beam=$use_psf_as_beam cell=$cell algorithm=$algorithm #select=$select #source=$source
mv 13co/13co.001 13co/13co.001_119.120_full_newNRO_1e7_robust2
