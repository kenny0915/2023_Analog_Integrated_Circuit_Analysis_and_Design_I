** 110061217 王彥智 hw3_b
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

vdd vdd 0 1.8
vb2 vb2 0 1.012
vin vin 0 0.5

rd vdd vout 100k
mn vout vb2 vin gnd n_18 l=1u w=15u

.dc vb2 0 1.012 1m
.probe 
+v(vout)
+deriv('v(vout)')

.tf v(vout) vin

.op
