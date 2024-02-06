** 110061217 hw2 part1
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

vdd vdd 0 1.8
vin vin 0 0.8

rd vdd vout 47k
mn vout vin 0 0 n_18 1u 1u

.dc vin 0 0.8 1m
.probe 
+v(vout)
+deriv('v(vout)')

.tf v(vout) vin

.op
