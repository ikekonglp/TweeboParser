################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../src/tagger/AlgUtils.o \
../src/tagger/Alphabet.o \
../src/tagger/Dictionary.o \
../src/tagger/Options.o \
../src/tagger/Parameters.o \
../src/tagger/Pipe.o \
../src/tagger/Reader.o \
../src/tagger/SequenceDecoder.o \
../src/tagger/SequenceDictionary.o \
../src/tagger/SequenceFeatures.o \
../src/tagger/SequenceInstance.o \
../src/tagger/SequenceInstanceNumeric.o \
../src/tagger/SequenceOptions.o \
../src/tagger/SequencePart.o \
../src/tagger/SequencePipe.o \
../src/tagger/SequenceReader.o \
../src/tagger/SequenceWriter.o \
../src/tagger/SerializationUtils.o \
../src/tagger/StringUtils.o \
../src/tagger/TimeUtils.o \
../src/tagger/TokenDictionary.o \
../src/tagger/TurboTagger.o \
../src/tagger/Writer.o 

CPP_SRCS += \
../src/tagger/SequenceDecoder.cpp \
../src/tagger/SequenceDictionary.cpp \
../src/tagger/SequenceFeatures.cpp \
../src/tagger/SequenceInstance.cpp \
../src/tagger/SequenceInstanceNumeric.cpp \
../src/tagger/SequenceOptions.cpp \
../src/tagger/SequencePart.cpp \
../src/tagger/SequencePipe.cpp \
../src/tagger/SequenceReader.cpp \
../src/tagger/SequenceWriter.cpp \
../src/tagger/TokenDictionary.cpp \
../src/tagger/TurboTagger.cpp 

OBJS += \
./src/tagger/SequenceDecoder.o \
./src/tagger/SequenceDictionary.o \
./src/tagger/SequenceFeatures.o \
./src/tagger/SequenceInstance.o \
./src/tagger/SequenceInstanceNumeric.o \
./src/tagger/SequenceOptions.o \
./src/tagger/SequencePart.o \
./src/tagger/SequencePipe.o \
./src/tagger/SequenceReader.o \
./src/tagger/SequenceWriter.o \
./src/tagger/TokenDictionary.o \
./src/tagger/TurboTagger.o 

CPP_DEPS += \
./src/tagger/SequenceDecoder.d \
./src/tagger/SequenceDictionary.d \
./src/tagger/SequenceFeatures.d \
./src/tagger/SequenceInstance.d \
./src/tagger/SequenceInstanceNumeric.d \
./src/tagger/SequenceOptions.d \
./src/tagger/SequencePart.d \
./src/tagger/SequencePipe.d \
./src/tagger/SequenceReader.d \
./src/tagger/SequenceWriter.d \
./src/tagger/TokenDictionary.d \
./src/tagger/TurboTagger.d 


# Each subdirectory must supply rules for building sources it contributes
src/tagger/%.o: ../src/tagger/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


