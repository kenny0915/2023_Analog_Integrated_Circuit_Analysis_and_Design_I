** 110061217 hw2 part2
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

.param l = 1u

vdd vdd 0 1.8
vin vin 0 0.16
vb vb 0 0.6

rd vdd vout 73k
mn vout vb vin vin n_18 l=l w=12*l

.dc vin 0 0.16 1m
.probe 
+v(vout)
+deriv('v(vout)')

.tf v(vout) vin

.op
