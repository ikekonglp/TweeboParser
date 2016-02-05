################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../src/parser/AlgUtils.o \
../src/parser/Alphabet.o \
../src/parser/DependencyDecoder.o \
../src/parser/DependencyDictionary.o \
../src/parser/DependencyFeatures.o \
../src/parser/DependencyInstance.o \
../src/parser/DependencyInstanceNumeric.o \
../src/parser/DependencyOptions.o \
../src/parser/DependencyPart.o \
../src/parser/DependencyPipe.o \
../src/parser/DependencyReader.o \
../src/parser/DependencyWriter.o \
../src/parser/Dictionary.o \
../src/parser/Options.o \
../src/parser/Parameters.o \
../src/parser/Pipe.o \
../src/parser/Reader.o \
../src/parser/SerializationUtils.o \
../src/parser/StringUtils.o \
../src/parser/TimeUtils.o \
../src/parser/TokenDictionary.o \
../src/parser/TurboParser.o \
../src/parser/Writer.o 

CPP_SRCS += \
../src/parser/DependencyDecoder.cpp \
../src/parser/DependencyDictionary.cpp \
../src/parser/DependencyFeatures.cpp \
../src/parser/DependencyInstance.cpp \
../src/parser/DependencyInstanceNumeric.cpp \
../src/parser/DependencyOptions.cpp \
../src/parser/DependencyPart.cpp \
../src/parser/DependencyPipe.cpp \
../src/parser/DependencyReader.cpp \
../src/parser/DependencyWriter.cpp \
../src/parser/TurboParser.cpp 

OBJS += \
./src/parser/DependencyDecoder.o \
./src/parser/DependencyDictionary.o \
./src/parser/DependencyFeatures.o \
./src/parser/DependencyInstance.o \
./src/parser/DependencyInstanceNumeric.o \
./src/parser/DependencyOptions.o \
./src/parser/DependencyPart.o \
./src/parser/DependencyPipe.o \
./src/parser/DependencyReader.o \
./src/parser/DependencyWriter.o \
./src/parser/TurboParser.o 

CPP_DEPS += \
./src/parser/DependencyDecoder.d \
./src/parser/DependencyDictionary.d \
./src/parser/DependencyFeatures.d \
./src/parser/DependencyInstance.d \
./src/parser/DependencyInstanceNumeric.d \
./src/parser/DependencyOptions.d \
./src/parser/DependencyPart.d \
./src/parser/DependencyPipe.d \
./src/parser/DependencyReader.d \
./src/parser/DependencyWriter.d \
./src/parser/TurboParser.d 


# Each subdirectory must supply rules for building sources it contributes
src/parser/%.o: ../src/parser/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


