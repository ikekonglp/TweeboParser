################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/classifier/Alphabet.cpp \
../src/classifier/Dictionary.cpp \
../src/classifier/Options.cpp \
../src/classifier/Parameters.cpp \
../src/classifier/Pipe.cpp \
../src/classifier/Reader.cpp \
../src/classifier/Writer.cpp 

OBJS += \
./src/classifier/Alphabet.o \
./src/classifier/Dictionary.o \
./src/classifier/Options.o \
./src/classifier/Parameters.o \
./src/classifier/Pipe.o \
./src/classifier/Reader.o \
./src/classifier/Writer.o 

CPP_DEPS += \
./src/classifier/Alphabet.d \
./src/classifier/Dictionary.d \
./src/classifier/Options.d \
./src/classifier/Parameters.d \
./src/classifier/Pipe.d \
./src/classifier/Reader.d \
./src/classifier/Writer.d 


# Each subdirectory must supply rules for building sources it contributes
src/classifier/%.o: ../src/classifier/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


