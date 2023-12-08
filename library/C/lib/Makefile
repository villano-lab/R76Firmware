##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased
##
## Debug
ProjectName            :=libR76Firmware
ConfigurationName      :=Debug
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=user
Date                   :=28/08/20
LinkerName             :=gcc
SharedObjectLinkerName :=gcc -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.o.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=./gcc/$(ProjectName).so
Preprocessors          :=$(PreprocessorSwitch)SCICOMPILER_EXPORTS 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="$(ProjectName).txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  "r5560" 
LibPath                := $(LibraryPathSwitch).

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := ar rcus
CXX      := gcc
CC       := gcc
CVER	 := -std=gnu99
CXXFLAGS :=  -g $(Preprocessors) $(CVER)
CFLAGS   :=  -g -fPIC $(Preprocessors) $(CVER)
ASFLAGS  :=
AS       := as

##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix) $(IntermediateDirectory)/R76Firmware_lib.c$(ObjectSuffix)



Objects=$(Objects0)

##
## Main Build Targets
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile) setregisters scanrate scanupper scanwindow singlerate fifotest getspectrum teststatus packettest

$(OutputFile): $(IntermediateDirectory)/.d $(Objects)
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(SharedObjectLinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)
	@$(MakeDirCommand) ".build-debug"
	@echo rebuilt > ".build-debug/$(ProjectName)"

fifotest: $(OutputFile)
	gcc -o fifotest src/fifotest.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CFLAGS) -lm -ldl
getspectrum: $(OutputFile)
	gcc -o getspectrum src/getspectrum.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl
setregisters: $(OutputFile)
	gcc -o setregisters src/setregisters.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl
scanrate: $(OutputFile)
	gcc -o scanrate src/scanrate.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl
scanupper: $(OutputFile)
	gcc -o scanupper src/scanupper.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl
scanwindow: $(OutputFile)
	gcc -o scanwindow src/scanwindow.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl
singlerate: $(OutputFile)
	gcc -o singlerate src/singlerate.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl
teststatus: $(OutputFile)
	gcc -o teststatus src/teststatus.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl
packettest: $(OutputFile)
	gcc -o packettest src/packettest.c src/UniversalTriggerShared.c -L. ./gcc/libR76Firmware.so ../../../r5560_sdk/linux/libr5560.so.1.0.0 $(CVER) -lm -ldl

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:

##
## Objects
##
$(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix): src/Legacy/circular_buffer.c $(IntermediateDirectory)/circular_buffer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "src/Legacy/circular_buffer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/circular_buffer.c$(DependSuffix): src/Legacy/circular_buffer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/circular_buffer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/circular_buffer.c$(DependSuffix) -MM src/Legacy/circular_buffer.c

$(IntermediateDirectory)/circular_buffer.c$(PreprocessSuffix): src/Legacy/circular_buffer.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/circular_buffer.c$(PreprocessSuffix) src/Legacy/circular_buffer.c

$(IntermediateDirectory)/R76Firmware_lib.c$(ObjectSuffix): src/Legacy/R76Firmware_lib.c $(IntermediateDirectory)/R76Firmware_lib.c$(DependSuffix)
	$(CC) $(SourceSwitch) "src/Legacy/R76Firmware_lib.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/R76Firmware_lib.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/R76Firmware_lib.c$(DependSuffix): src/Legacy/R76Firmware_lib.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/R76Firmware_lib.c$(ObjectSuffix) -MF$(IntermediateDirectory)/R76Firmware_lib.c$(DependSuffix) -MM src/Legacy/R76Firmware_lib.c

$(IntermediateDirectory)/R76Firmware_lib.c$(PreprocessSuffix): src/Legacy/R76Firmware_lib.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/R76Firmware_lib.c$(PreprocessSuffix) src/Legacy/R76Firmware_lib.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/
