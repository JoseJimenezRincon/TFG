############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project AStarStaticHLS
set_top aStar
add_files aStarStatic.h
add_files aStarStatic.cpp
add_files -tb ../../../workspace/AvoidObstaclesStatic/vehicle.txt
add_files -tb result.golden.dat
add_files -tb ../../../workspace/AvoidObstaclesStatic/map.txt
add_files -tb aStartStatic_test.cpp
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./AStarStaticHLS/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -format ip_catalog
