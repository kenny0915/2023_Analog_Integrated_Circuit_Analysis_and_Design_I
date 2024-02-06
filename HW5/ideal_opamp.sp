* 110061217 hw5 part_1
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

.param gain=500

vin vin gnd 0.9

et vout gnd gnd vx gain

r1 vin vx 1k
r2 vx vout 10k

cl vout gnd 2p

.dc gain 500 600 1
.probe dc
+deriv'v(vout)/v(vin)'
.end
