** 110061217 hw1 part1
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
+captab

.param l = .18u

vdd vdd gnd 1.8
.dc l .18u 10u .01u

.probe dc
+vth(m)				** probe threshold voltage
+gmo(m)				** probe transconductance 
+gdso(m)			** probe output conductance
+vdsat(m)			** probe saturation drain voltage
+'gmo(m)/gdso(m)'	** probe intrinsic gain
+'abs(gmo(m)/id(m))'		** probe power efficiency
+'gmo(m)/cggbo(m)'	** probe speed

** nmos
i vdd i 30u
m i i gnd gnd n_18 l=l w=3*l
.alter
** pmos
i i 0 30u
m i i vdd vdd p_18 l=l w=3*l
.end
