################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../deps/AD3-2.0.2/ad3/Factor.o \
../deps/AD3-2.0.2/ad3/FactorGraph.o \
../deps/AD3-2.0.2/ad3/GenericFactor.o \
../deps/AD3-2.0.2/ad3/Utils.o 

CPP_SRCS += \
../deps/AD3-2.0.2/ad3/Factor.cpp \
../deps/AD3-2.0.2/ad3/FactorGraph.cpp \
../deps/AD3-2.0.2/ad3/GenericFactor.cpp \
../deps/AD3-2.0.2/ad3/Utils.cpp 

OBJS += \
./deps/AD3-2.0.2/ad3/Factor.o \
./deps/AD3-2.0.2/ad3/FactorGraph.o \
./deps/AD3-2.0.2/ad3/GenericFactor.o \
./deps/AD3-2.0.2/ad3/Utils.o 

CPP_DEPS += \
./deps/AD3-2.0.2/ad3/Factor.d \
./deps/AD3-2.0.2/ad3/FactorGraph.d \
./deps/AD3-2.0.2/ad3/GenericFactor.d \
./deps/AD3-2.0.2/ad3/Utils.d 


# Each subdirectory must supply rules for building sources it contributes
deps/AD3-2.0.2/ad3/%.o: ../deps/AD3-2.0.2/ad3/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


