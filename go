# !/bin/sh -x
echo $1.mma

mma $1.mma
fluidsynth /usr/share/sounds/sf2/FluidR3_GM.sf2 $1.mid
