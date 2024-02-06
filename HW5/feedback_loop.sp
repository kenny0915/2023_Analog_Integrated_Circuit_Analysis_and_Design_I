** 110061217 王彥智 part2
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
.temp = 25

.param x=1k

vdd vdd   0 1.8
vss vss   0 0
vb  vb    0 0.45
vn vcasn 0 1
vp  vcasp 0 0.85

vcm   vcm   vss dc=0.9
vdiff vdiff vss dc=0  ac=1
Ep    vip   vcm vdiff vss  0.5
En    vin   vcm vdiff vss -0.5

mb vmb  vb    vss vss n_18 l=.5u  w=6.8u
m1 vm1  vx    vmb vss n_18 l=.5u   w=2u
m2 vm2  vin   vmb vss n_18 l=.5u   w=2u
m3 vm3  vcasn vm1 vss n_18 l=.5u   w=2.2u 
m4 vout vcasn vm2 vss n_18 l=.5u   w=2.2u 
m5 vm3  vcasp vm7 vdd p_18 l=.5u   w=2u
m6 vout vcasp vm8 vdd p_18 l=.5u   w=2u
m7 vm7  vm3   vdd vdd p_18 l=.5u   w=2u
m8 vm8  vm3   vdd vdd p_18 l=.5u   w=2u

cl vss  vout 2p
r1 vx  vip   9.8k
r2 vout  vx 98k
.tf v(vout) vdiff
.pz v(vout) vdiff
.ac dec 10 1 1g sweep x dec 1 1k 1000x 
.probe ac vdb(vout) vp(vout)
.measure ac gain_db max vdb(vout)
.measure ac bandwidth when vdb(vout)='gain_db-3'

.op
