** 110061217 hw1 part3
.protect
.lib 'cic018.l' tt
.unprotect
.option post = 1
+captab

.param l = 1.2u
.param vs = 0

vdd vdd gnd 1.8
vg vg gnd dc=vs+0.7
vs vs gnd vs
.dc vs 0 1 1m

.probe dc 
+id(m)		** probe drain current
+vth(m)		** probe threshold voltage
+gmo(m)		** probe transconductance


** source and body not connected
m vdd vg vs gnd n_18 l=l w=2*l m=1
.alter
** source and boby connected
m vdd vg vs vs n_18 l=l w=2*l m=1
.end
