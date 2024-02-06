** 110061217 王彥智 hw6
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 27

vdd   vdd   gnd   dc=1.8
vincm vincm gnd   dc=0.8
vdiff vdiff gnd   dc=0  ac=1
Ep    vip   vincm vdiff gnd  0.5
En    vin   vincm vdiff gnd -0.5

.param w=1.4u
+      l=1.4u

*** two stage amp
vbp vbp gnd 1.2

m1 x1  vbp vdd vdd p_18 w=2*3*w l=l
m2 vop vbp vdd vdd p_18 w=3*w   l=l
m3 von vbp vdd vdd p_18 w=3*w   l=l
m4 x4  vip x1  vdd p_18 w=3*w   l=l
m5 x5  vin x1  vdd p_18 w=3*w   l=l
m6 x4  vfb gnd gnd n_18 w=w     l=l
m7 x5  vfb gnd gnd n_18 w=w     l=l
m8 vop x4  gnd gnd n_18 w=w     l=l
m9 von x5  gnd gnd n_18 w=w     l=l

cl1 vop gnd 1p
cl2 von gnd 1p

rc1 x5   tmp1 250k
cc1 tmp1 von 50p
rc2 x4   tmp2 250k
cc2 tmp2 vop 50p

*** CM sense

r1 vop vcm 80x
r2 von vcm 80x

*** CMFB: replace following e element
* e1 vfb gnd vcm vref 1000
vb vb gnd 1.2
vref vref gnd 0.9

mopb tmp3 vb   vdd  vdd p_18 w=2*3*w l=l
mop1 tmp4 vref tmp3 vdd p_18 w=3*w   l=l
mop2 vfb  vcm  tmp3 vdd p_18 w=3*w   l=l
mop3 tmp4 tmp4 gnd  gnd n_18 w=w     l=l
mop4 vfb  tmp4 gnd  gnd n_18 w=w     l=l


*** q4: change vfb to tmp5 in 2 stage amp
* vac vac gnd 0 ac=1

* lt vfb tmp5 1e+100
* ct tmp5 vac  1e+100

* .tf v(vfb) vac
* .pz v(vfb) vac
* .ac dec 10 1 1g
* .probe vdb(vfb) vp(vfb) vac 

*** q5: change vdiff to ac=0.1m
*.ic v(vop) 0
*.ic v(von) 0
*.tr 1n 3m

*** measure
.tf v(vop, von) vdiff
.pz v(vop, von) vdiff
.ac dec 10 1 1g 
*+ sweep vincm 0 1.8 0.01
.probe vdb(vop,von) vp(vop, von) vdiff
.measure ac phase_margin find par('180+vp(vop, von)') when v(vop, von)=1
.measure ac gain_db max vdb(vop, von)
.measure ac GBW when vdb(vop, von)=0
.op

.alter
.lib 'cic018.l' ff

.alter
.lib 'cic018.l' ss

.end
