set niter=1300000
set run_invert = 1
#se1 vis = "nro/13co/carma_uv_full_171.172_scalefactor.mir,nro/13co/13co.uv_full_171.172_scalefactor.all"
#set vis = "nro/13co/carma_uv_42_171.172_scalefactor.mir,nro/13co/13co.uv_42_171.172_scalefactor.mir"

#set carvis = "nro/13co/carma_carmacell0.5_uv6to1000_nrobm16_imsize200.mir"
#set nrovis = "nro/13co/13co.carmacell1_uv6to1000_nrobm16_imsize200.all"
set carvis = "nro/13co/carma_carmacell1_uv6to1000_nrobm16.mir"
set nrovis = "nro/13co/13co.carmacell1_uv6to1000_nrobm16.all"

#set vis = "nro/13co/13co.carmacell1_uvall.all,nro/13co/carma_carmacell1_uvall.mir2"
#set vis = "nro/13co/carma_uv6to1000_42_171.172_scalefactor.mir,nro/13co/13co.uv6to1000_42_171.172_scalefactor.all"
#set vis = "nro/13co/13co.uvall_42_171.172_scalefactor.all"
#set dirty_name = 'carmaonly_noscalefactor'
#set dirty_name = 'omc_full_mosaic.double.systemp_171.172'
#set dirty_name = 'combined_cell1rob2_uv6to1000_nrobm16_not10m10m'
set dirty_name = 'combined_all-12'
set source = 'omc42'
set robust = 2
set cell = 1
set imsize = 257 
set run_mkmask = 1
set mkmask_dummy = 1
set run_restart = 0
set restart_channel = 2
set run_clean = 1
set run_restor = 1
set cutoff = 0.01
set gain = 0.1
set polygon_region = 'region_none.txt'
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
set remove_baselines = "6m10m"
if ($remove_baselines == "6m10m") then 
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(7,8,9,10,11,12,13,14,15)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(7,8,9,10)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(11,12,13,14,15)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(11,12,13)"
	#uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(15)"
	uvcat vis=$carvis out="cartmp2.mir" select="-ant(1,2,3,4,5,6)(12)"
	set carvis = "cartmp2.mir"
endif
set remove_baselines = "6m6m"
if ($remove_baselines == "6m6m") then 
	uvcat vis=$carvis out="cartmp3.mir" select="-ant(7,8,9,10,11,12,13,14,15)(12)"
	set carvis = "cartmp3.mir"
endif

#set vis = $carvis,$nrovis
set vis = $carvis,$nrovis

time images_line_isella.csh imsize=$imsize niter=$niter gain=$gain run_mkmask=$run_mkmask run_restart=$run_restart cutoff=$cutoff polygon_region=$polygon_region restart_channel=$restart_channel run_invert=$run_invert run_clean=$run_clean run_restor=$run_restor robust=$robust vis=$vis dirty_name=$dirty_name options=$options region_limit=$region_limit different_beam=$different_beam use_psf_as_beam=$use_psf_as_beam cell=$cell #select=$select #source=$source
#mv 13co/13co.001/ 13co/13co.001_nrobm16_uv6to1000_1e6_not10m10m
mv 13co/13co.001/ 13co/13co.001_all-12
fits in=13co/combined_all-12_13co.map out=13co/baseline_test/all-12.map.fits op=xyout
fits in=13co/13co.001_all-12/13co.001.cm out=13co/baseline_test/all-12.cm.fits op=xyout
