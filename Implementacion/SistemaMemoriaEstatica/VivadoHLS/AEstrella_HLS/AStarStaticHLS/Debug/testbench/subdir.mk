################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/jose/tfg.jose.jimenez/VivadoHLS/AStarStatic/aStartStatic_test.cpp 

OBJS += \
./testbench/aStartStatic_test.o 

CPP_DEPS += \
./testbench/aStartStatic_test.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/aStartStatic_test.o: /home/jose/tfg.jose.jimenez/VivadoHLS/AStarStatic/aStartStatic_test.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/home/jose/tfg/Vivado_HLS/2015.4/include/ap_sysc -I/home/jose/tfg/Vivado_HLS/2015.4/include/etc -I/home/jose/tfg/Vivado_HLS/2015.4/lnx64/tools/systemc/include -I/home/jose/tfg/Vivado_HLS/2015.4/include -I/home/jose/tfg/Vivado_HLS/2015.4/lnx64/tools/auto_cc/include -I/home/jose/tfg.jose.jimenez/VivadoHLS/AStarStatic -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


