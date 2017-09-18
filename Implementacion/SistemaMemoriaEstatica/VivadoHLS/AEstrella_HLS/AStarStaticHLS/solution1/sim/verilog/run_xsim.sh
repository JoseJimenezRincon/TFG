
xelab xil_defaultlib.apatb_aStar_top -prj aStar.prj --lib "ieee_proposed=./ieee_proposed" -s aStar 
xsim --noieeewarnings aStar -tclbatch aStar.tcl

