*** 110061217 王彥智 part2
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.option accurate = 1
.option runlvl = 5
.temp = 25

*** power supply

vdd vdd gnd 1.3616 ac=0
vss vss gnd 0
vb  vb  gnd 0.5

*** input signal

vramp  vramp  gnd pwl(0 0.35 50u 1.35)
vinput vinput gnd 0.95

*** top cicuit

x_cmp Vdd Vss Vb vinput vramp vout cmp

*** tr anaylsis

.tran 0.01u 100u sweep vinput 0.35 1.3 0.1

*** comparator

.subckt cmp vdd vss vb vip vin vout 
mb  xb   vb  vss vss n_18 w=0.6u l=0.6u
m1  x1   vip xb  vss n_18 w=0.6u l=0.6u
m2  x2   vin xb  vss n_18 w=0.6u l=0.6u
m3  x2   x1  vdd vdd p_18 w=0.6u l=0.6u
m4  x1   x2  vdd vdd p_18 w=0.6u l=0.6u
m5  x1   x1  vdd vdd p_18 w=0.6u l=0.6u
m6  x2   x2  vdd vdd p_18 w=0.6u l=0.6u
m7  x7   x1  vdd vdd p_18 w=0.6u l=0.6u
m8  vout x2  vdd vdd p_18 w=0.6u l=0.6u
m9  x7   x7  vss vss n_18 w=0.6u l=0.6u
m10 vout x7  vss vss n_18 w=0.6u l=0.6u
.ends

.op

