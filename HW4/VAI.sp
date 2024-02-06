** 110061217 王彥智 hw4_4
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

vin vx gnd pulse 0 1 5 1n 1n 10

eva vout0 0 0 x 1000
rf x vout0 12k
r1 vx x 2k
r2 vy x 1k

ein1 vout1 0 0 n1 1000
cin1 n1 vout1 1u
rin1 vout0 n1 100k

ein2 vy 0 0 n2 1000
cin2 n2 vy 1u
rin2 vout1 n2 100k


.tran 1m 10
.meas TRAN Vmin1 MIN V(vy) FROM=5 TO=10
.meas TRAN Vmin2 MIN V(vy) FROM=9.8 TO=10
.meas TRAN tp trig v(vy) val='Vmin1' fall=1 targ v(vy) VAL='Vmin2' fall=26

.op
