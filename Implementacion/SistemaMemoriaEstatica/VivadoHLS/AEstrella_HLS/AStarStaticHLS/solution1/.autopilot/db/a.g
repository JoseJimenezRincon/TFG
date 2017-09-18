#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/jose/tfg.jose.jimenez/VivadoHLS/AStarStatic/AStarStaticHLS/solution1/.autopilot/db/a.g.bc ${1+"$@"}
