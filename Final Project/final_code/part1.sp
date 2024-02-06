** 110061217 王彥智 final part1
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.option accurate = 1
.option runlvl = 5
.temp = 25

*** power supply

vdd vdd gnd 1.8 ac=0
vss vss gnd 0

*** opamp base BGR

m1 v1 vo vdd vdd p_18 w=30u l=10u m=1
m2 v2   vo vdd vdd p_18 w=30u l=10u m=1
m3 vref vo vdd vdd p_18 w=30u l=10u m=1

q1 gnd gnd v1 gnd PNP_V50X50 m=1
q2 gnd gnd v3   gnd PNP_V50X50 m=12
q3 gnd gnd v4   gnd PNP_V50X50 m=1

r1 v2   v3 200k
r2 vref v4 2100k

*** two stage opamp with constant-gm and start-up circuit(e1 vo gnd v2 v1 3000)

xopamp v1 v2 vb vo vdd vss twostageopamp

xcstgm vb vdd vss const_gm_with_start_up_ckt

.probe v(vbias)

*** two stage opamp

.subckt twostageopamp vin vip vb vo vdd vss

r1 vb va  5x
r2 va vss 5x

m1 x1 vin xb gnd n_18 w=1u l=1u
m2 x2 vip xb gnd n_18 w=1u l=1u
mb xb va vss vss n_18 w=2u l=1u
m3 x1 x1 vdd vdd p_18 w=3u l=1u
m4 x2 x1 vdd vdd p_18 w=3u l=1u
m5 vo va vss vss n_18 w=1u l=1u
m6 vo x2 vdd vdd p_18 w=3u l=1u

.ends

*** constant-gm core with start-up circuit

.subckt const_gm_with_start_up_ckt vbias vdd vss

*** start-up circuit

m1 vx1 vss   vdd vdd p_18 w=0.9u l=20u
m2 vx2 vss   vx1 vdd p_18 w=0.9u l=20u
m3 vx2 vbias vss vss n_18 w=0.3u l=20u
m4 vx3 vx2   vss vss n_18 w=0.3u l=20u

*** constant-gm biasing circuit

m5 vbias vx3   vdd vdd p_18 w=3u l=1u
m6 vx3   vx3   vdd vdd p_18 w=3u l=1u
m7 vbias vbias vss vss n_18 w=1u l=1u
m8 vx3   vbias vx4 vss n_18 w=4u l=1u

rcgm vx4 vss 150k

.ends

*** dc and ac anaylsis

*.dc temp -40 125 5

*.ac dec 20 1 1G sweep temp -40 125 5
*.measure ac PSR_at_dc  FIND vdb(vref) at=1
*.measure ac PSR_at_10k FIND vdb(vref) at=10k

*vdd vdd gnd pwl(0 0 10u 0 100u 2)
*.tran 0.01u 500u

.op

*** stability check

*vac1 vac1 gnd dc=0 ac=-0.5
*vac2 vac2 gnd dc=0 ac=0.5

*ct1 v1 vac1   1e+100
*lt1 v1 vout1 1e+100
*ct2 v2 vac2   1e+100
*lt2 v2 vout2 1e+100  

*.ac dec 10 1 1g
*.measure ac phase_margin find par('180+vp(vout1, vout2)') when vdb(vout1, vout2)=0
*.measure ac gain_db max vdb(vout1, vout2)

*** alter condition

.alter 
.lib 'cic018.l' ff

.alter
.lib 'cic018.l' ss

*.alter
*.lib 'cic018.l' tt
*vdd vdd gnd 1.98

*.alter
*.lib 'cic018.l' ff
*vdd vdd gnd 1.98

*.alter
*.lib 'cic018.l' ss
*vdd vdd gnd 1.98

*.alter
*.lib 'cic018.l' tt
*vdd vdd gnd 1.62

*.alter
*.lib 'cic018.l' ff
*vdd vdd gnd 1.62

*.alter
*.lib 'cic018.l' ss
*vdd vdd gnd 1.62
