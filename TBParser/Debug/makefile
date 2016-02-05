################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/util/subdir.mk
-include src/tagger/subdir.mk
-include src/parser/subdir.mk
-include src/classifier/subdir.mk
-include deps/glog-0.3.2/src/windows/subdir.mk
-include deps/glog-0.3.2/src/subdir.mk
-include deps/glog-0.3.2/.libs/subdir.mk
-include deps/glog-0.3.2/subdir.mk
-include deps/gflags-2.0/src/windows/subdir.mk
-include deps/gflags-2.0/src/subdir.mk
-include deps/gflags-2.0/.libs/subdir.mk
-include deps/gflags-2.0/subdir.mk
-include deps/AD3-2.0.2/examples/parsing/subdir.mk
-include deps/AD3-2.0.2/examples/logic/subdir.mk
-include deps/AD3-2.0.2/examples/dense/subdir.mk
-include deps/AD3-2.0.2/ad3/subdir.mk
-include deps/AD3-2.0.2/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: TBParser

# Tool invocations
TBParser: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C++ Linker'
	g++  -o "TBParser" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C++_DEPS)$(C_DEPS)$(CC_DEPS)$(CPP_DEPS)$(EXECUTABLES)$(CXX_DEPS)$(C_UPPER_DEPS) TBParser
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
