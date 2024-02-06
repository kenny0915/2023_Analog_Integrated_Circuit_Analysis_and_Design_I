** 110061217 王彥智 hw3_a
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

vdd vdd 0 1.8
vb1 vb1 0 0.9
vin vin 0 533m

mp vout vb1 vdd vdd p_18 l=3u w=3u
mn vout vin gnd gnd n_18 l=3u w=3u

.dc vin 0 0.533 1m
.probe 
+v(vout)
+deriv('v(vout)')

.tf v(vout) vin

.op
