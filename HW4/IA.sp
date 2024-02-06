** 110061217 王彥智 hw4_3
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

vin vin 0 5

eopamp vout 0 0 x 1000
r1 x vout 31k
r2 vin x 1k

.dc vin 0 5 1m
.probe 
+v(vout)
+deriv('v(vout)')

.meas derivative_of_vout deriv v(vout) when v(vin)=2.5

.tf v(vout) vin

.op
