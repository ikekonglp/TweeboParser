################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../deps/gflags-2.0/src/gflags.cc \
../deps/gflags-2.0/src/gflags_completions.cc \
../deps/gflags-2.0/src/gflags_nc.cc \
../deps/gflags-2.0/src/gflags_reporting.cc \
../deps/gflags-2.0/src/gflags_strip_flags_test.cc \
../deps/gflags-2.0/src/gflags_unittest-main.cc \
../deps/gflags-2.0/src/gflags_unittest.cc \
../deps/gflags-2.0/src/gflags_unittest_main.cc 

OBJS += \
./deps/gflags-2.0/src/gflags.o \
./deps/gflags-2.0/src/gflags_completions.o \
./deps/gflags-2.0/src/gflags_nc.o \
./deps/gflags-2.0/src/gflags_reporting.o \
./deps/gflags-2.0/src/gflags_strip_flags_test.o \
./deps/gflags-2.0/src/gflags_unittest-main.o \
./deps/gflags-2.0/src/gflags_unittest.o \
./deps/gflags-2.0/src/gflags_unittest_main.o 

CC_DEPS += \
./deps/gflags-2.0/src/gflags.d \
./deps/gflags-2.0/src/gflags_completions.d \
./deps/gflags-2.0/src/gflags_nc.d \
./deps/gflags-2.0/src/gflags_reporting.d \
./deps/gflags-2.0/src/gflags_strip_flags_test.d \
./deps/gflags-2.0/src/gflags_unittest-main.d \
./deps/gflags-2.0/src/gflags_unittest.d \
./deps/gflags-2.0/src/gflags_unittest_main.d 


# Each subdirectory must supply rules for building sources it contributes
deps/gflags-2.0/src/%.o: ../deps/gflags-2.0/src/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


