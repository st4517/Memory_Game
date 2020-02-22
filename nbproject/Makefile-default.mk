#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Memory_Game.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Memory_Game.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=StartMessage.asm LCD.asm lfsr.asm Flash_Seq.asm interrupt.asm Main.asm config.asm keypad.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/StartMessage.o ${OBJECTDIR}/LCD.o ${OBJECTDIR}/lfsr.o ${OBJECTDIR}/Flash_Seq.o ${OBJECTDIR}/interrupt.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/config.o ${OBJECTDIR}/keypad.o
POSSIBLE_DEPFILES=${OBJECTDIR}/StartMessage.o.d ${OBJECTDIR}/LCD.o.d ${OBJECTDIR}/lfsr.o.d ${OBJECTDIR}/Flash_Seq.o.d ${OBJECTDIR}/interrupt.o.d ${OBJECTDIR}/Main.o.d ${OBJECTDIR}/config.o.d ${OBJECTDIR}/keypad.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/StartMessage.o ${OBJECTDIR}/LCD.o ${OBJECTDIR}/lfsr.o ${OBJECTDIR}/Flash_Seq.o ${OBJECTDIR}/interrupt.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/config.o ${OBJECTDIR}/keypad.o

# Source Files
SOURCEFILES=StartMessage.asm LCD.asm lfsr.asm Flash_Seq.asm interrupt.asm Main.asm config.asm keypad.asm



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Memory_Game.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18f87k22
MP_LINKER_DEBUG_OPTION= 
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/StartMessage.o: StartMessage.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/StartMessage.o.d 
	@${RM} ${OBJECTDIR}/StartMessage.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/StartMessage.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/StartMessage.lst\" -e\"${OBJECTDIR}/StartMessage.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/StartMessage.o\" \"StartMessage.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/StartMessage.o"
	@${FIXDEPS} "${OBJECTDIR}/StartMessage.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD.o: LCD.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${RM} ${OBJECTDIR}/LCD.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD.lst\" -e\"${OBJECTDIR}/LCD.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD.o\" \"LCD.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/lfsr.o: lfsr.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lfsr.o.d 
	@${RM} ${OBJECTDIR}/lfsr.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/lfsr.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/lfsr.lst\" -e\"${OBJECTDIR}/lfsr.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/lfsr.o\" \"lfsr.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/lfsr.o"
	@${FIXDEPS} "${OBJECTDIR}/lfsr.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Flash_Seq.o: Flash_Seq.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Flash_Seq.o.d 
	@${RM} ${OBJECTDIR}/Flash_Seq.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Flash_Seq.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Flash_Seq.lst\" -e\"${OBJECTDIR}/Flash_Seq.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Flash_Seq.o\" \"Flash_Seq.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Flash_Seq.o"
	@${FIXDEPS} "${OBJECTDIR}/Flash_Seq.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/interrupt.o: interrupt.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupt.o.d 
	@${RM} ${OBJECTDIR}/interrupt.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/interrupt.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/interrupt.lst\" -e\"${OBJECTDIR}/interrupt.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/interrupt.o\" \"interrupt.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/interrupt.o"
	@${FIXDEPS} "${OBJECTDIR}/interrupt.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Main.o: Main.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Main.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Main.lst\" -e\"${OBJECTDIR}/Main.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Main.o\" \"Main.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Main.o"
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/keypad.o: keypad.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keypad.o.d 
	@${RM} ${OBJECTDIR}/keypad.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/keypad.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_SIMULATOR=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/keypad.lst\" -e\"${OBJECTDIR}/keypad.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/keypad.o\" \"keypad.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/keypad.o"
	@${FIXDEPS} "${OBJECTDIR}/keypad.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/StartMessage.o: StartMessage.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/StartMessage.o.d 
	@${RM} ${OBJECTDIR}/StartMessage.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/StartMessage.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/StartMessage.lst\" -e\"${OBJECTDIR}/StartMessage.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/StartMessage.o\" \"StartMessage.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/StartMessage.o"
	@${FIXDEPS} "${OBJECTDIR}/StartMessage.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/LCD.o: LCD.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LCD.o.d 
	@${RM} ${OBJECTDIR}/LCD.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LCD.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LCD.lst\" -e\"${OBJECTDIR}/LCD.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/LCD.o\" \"LCD.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LCD.o"
	@${FIXDEPS} "${OBJECTDIR}/LCD.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/lfsr.o: lfsr.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/lfsr.o.d 
	@${RM} ${OBJECTDIR}/lfsr.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/lfsr.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/lfsr.lst\" -e\"${OBJECTDIR}/lfsr.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/lfsr.o\" \"lfsr.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/lfsr.o"
	@${FIXDEPS} "${OBJECTDIR}/lfsr.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Flash_Seq.o: Flash_Seq.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Flash_Seq.o.d 
	@${RM} ${OBJECTDIR}/Flash_Seq.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Flash_Seq.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Flash_Seq.lst\" -e\"${OBJECTDIR}/Flash_Seq.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Flash_Seq.o\" \"Flash_Seq.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Flash_Seq.o"
	@${FIXDEPS} "${OBJECTDIR}/Flash_Seq.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/interrupt.o: interrupt.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupt.o.d 
	@${RM} ${OBJECTDIR}/interrupt.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/interrupt.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/interrupt.lst\" -e\"${OBJECTDIR}/interrupt.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/interrupt.o\" \"interrupt.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/interrupt.o"
	@${FIXDEPS} "${OBJECTDIR}/interrupt.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/Main.o: Main.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/Main.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/Main.lst\" -e\"${OBJECTDIR}/Main.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/Main.o\" \"Main.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/Main.o"
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/config.o: config.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/config.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/config.lst\" -e\"${OBJECTDIR}/config.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/config.o\" \"config.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/config.o"
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/keypad.o: keypad.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keypad.o.d 
	@${RM} ${OBJECTDIR}/keypad.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/keypad.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/keypad.lst\" -e\"${OBJECTDIR}/keypad.err\" $(ASM_OPTIONS)    -o\"${OBJECTDIR}/keypad.o\" \"keypad.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/keypad.o"
	@${FIXDEPS} "${OBJECTDIR}/keypad.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Memory_Game.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_SIMULATOR=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/Memory_Game.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/Memory_Game.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/Memory_Game.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
