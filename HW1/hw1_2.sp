** 110061217 hw1 part2
.protect
.lib 'cic018.l' tt
.unprotect
.option post=1
+captab

.param l = .18u
.param vg = 0
.dc vg 0 1.8 .01 sweep l 1.8u 10u 1.8u

vdd vdd gnd 1.8
vg vg gnd vg

.probe dc
+id(m)	** probe drain current

** nmos
m vdd vg 0 0 n_18 l=l w=3*l
.alter
** pmos
m 0 vg vdd vdd p_18 l=l w=3*l
.end
