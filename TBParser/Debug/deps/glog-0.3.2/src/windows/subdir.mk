################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../deps/glog-0.3.2/src/windows/port.cc 

OBJS += \
./deps/glog-0.3.2/src/windows/port.o 

CC_DEPS += \
./deps/glog-0.3.2/src/windows/port.d 


# Each subdirectory must supply rules for building sources it contributes
deps/glog-0.3.2/src/windows/%.o: ../deps/glog-0.3.2/src/windows/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


