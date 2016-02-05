################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/util/AlgUtils.cpp \
../src/util/SerializationUtils.cpp \
../src/util/StringUtils.cpp \
../src/util/TimeUtils.cpp 

OBJS += \
./src/util/AlgUtils.o \
./src/util/SerializationUtils.o \
./src/util/StringUtils.o \
./src/util/TimeUtils.o 

CPP_DEPS += \
./src/util/AlgUtils.d \
./src/util/SerializationUtils.d \
./src/util/StringUtils.d \
./src/util/TimeUtils.d 


# Each subdirectory must supply rules for building sources it contributes
src/util/%.o: ../src/util/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


