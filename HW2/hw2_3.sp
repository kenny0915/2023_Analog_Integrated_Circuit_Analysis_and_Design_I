** 110061217 hw2 part3
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

vdd vdd 0 1.8
vin vin 0 1.6

rs vout 0 37k
mn vdd vin vout vout n_18 1u 1u

.dc vin 0 1.6 10m
.probe 
+v(vout)
+deriv('v(vout)')

.tf v(vout) vin

.op
