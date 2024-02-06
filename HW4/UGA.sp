** 110061217 王彥智 hw4_1
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

vin vin 0 5

eopamp vout 0 vin vout 1000

.dc vin 0 5 1m
.probe 
+v(vout)
+deriv('v(vout)')

.meas derivative_of_vout deriv v(vout) when v(vin)=2.5

.tf v(vout) vin

.op
