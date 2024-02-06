** 110061217 王彥智 hw3_c
.protect
.lib 'cic018.l' tt
.unprotect
.option 
+post
+captab
.temp = 25

.param vin=533m

vdd vdd 0 1.8
vb1 vb1 0 0.9
vb2 vb2 0 1.012
vin vin 0 vin ac

mpa vx vb1 vdd vdd p_18 l=3u w=3u
mna vx vin gnd gnd n_18 l=3u w=3u
rd vdd vout 100k
mnb vout vb2 vx gnd n_18 l=1u w=15u
i vx gnd 10u

*.dc vin 0 .386 1m
*.probe 
*+v(vout)
*+v(vx)
*+deriv('v(vout)')

.ac dec 10 1 100g
.probe vdb(vout) vp(vout)
.meas ac dcgain_in_db max vdb(vout)
.meas ac BW when vdb(vout) = 'dcgain_in_db-3'
.meas ac UGB when vdb(vout) = 0

.op
.tf v(vout) vin
.pz v(vout) vin
