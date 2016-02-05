################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../deps/glog-0.3.2/src/demangle.cc \
../deps/glog-0.3.2/src/demangle_unittest.cc \
../deps/glog-0.3.2/src/logging.cc \
../deps/glog-0.3.2/src/logging_striptest10.cc \
../deps/glog-0.3.2/src/logging_striptest2.cc \
../deps/glog-0.3.2/src/logging_striptest_main.cc \
../deps/glog-0.3.2/src/logging_unittest.cc \
../deps/glog-0.3.2/src/mock-log_test.cc \
../deps/glog-0.3.2/src/raw_logging.cc \
../deps/glog-0.3.2/src/signalhandler.cc \
../deps/glog-0.3.2/src/signalhandler_unittest.cc \
../deps/glog-0.3.2/src/stacktrace_unittest.cc \
../deps/glog-0.3.2/src/stl_logging_unittest.cc \
../deps/glog-0.3.2/src/symbolize.cc \
../deps/glog-0.3.2/src/symbolize_unittest.cc \
../deps/glog-0.3.2/src/utilities.cc \
../deps/glog-0.3.2/src/utilities_unittest.cc \
../deps/glog-0.3.2/src/vlog_is_on.cc 

OBJS += \
./deps/glog-0.3.2/src/demangle.o \
./deps/glog-0.3.2/src/demangle_unittest.o \
./deps/glog-0.3.2/src/logging.o \
./deps/glog-0.3.2/src/logging_striptest10.o \
./deps/glog-0.3.2/src/logging_striptest2.o \
./deps/glog-0.3.2/src/logging_striptest_main.o \
./deps/glog-0.3.2/src/logging_unittest.o \
./deps/glog-0.3.2/src/mock-log_test.o \
./deps/glog-0.3.2/src/raw_logging.o \
./deps/glog-0.3.2/src/signalhandler.o \
./deps/glog-0.3.2/src/signalhandler_unittest.o \
./deps/glog-0.3.2/src/stacktrace_unittest.o \
./deps/glog-0.3.2/src/stl_logging_unittest.o \
./deps/glog-0.3.2/src/symbolize.o \
./deps/glog-0.3.2/src/symbolize_unittest.o \
./deps/glog-0.3.2/src/utilities.o \
./deps/glog-0.3.2/src/utilities_unittest.o \
./deps/glog-0.3.2/src/vlog_is_on.o 

CC_DEPS += \
./deps/glog-0.3.2/src/demangle.d \
./deps/glog-0.3.2/src/demangle_unittest.d \
./deps/glog-0.3.2/src/logging.d \
./deps/glog-0.3.2/src/logging_striptest10.d \
./deps/glog-0.3.2/src/logging_striptest2.d \
./deps/glog-0.3.2/src/logging_striptest_main.d \
./deps/glog-0.3.2/src/logging_unittest.d \
./deps/glog-0.3.2/src/mock-log_test.d \
./deps/glog-0.3.2/src/raw_logging.d \
./deps/glog-0.3.2/src/signalhandler.d \
./deps/glog-0.3.2/src/signalhandler_unittest.d \
./deps/glog-0.3.2/src/stacktrace_unittest.d \
./deps/glog-0.3.2/src/stl_logging_unittest.d \
./deps/glog-0.3.2/src/symbolize.d \
./deps/glog-0.3.2/src/symbolize_unittest.d \
./deps/glog-0.3.2/src/utilities.d \
./deps/glog-0.3.2/src/utilities_unittest.d \
./deps/glog-0.3.2/src/vlog_is_on.d 


# Each subdirectory must supply rules for building sources it contributes
deps/glog-0.3.2/src/%.o: ../deps/glog-0.3.2/src/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


