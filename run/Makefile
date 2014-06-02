#!/usr/bin/sh

all:	sim
SHELL = /bin/sh
#MS=-s

##########################################################################
#
# DUT Sources
#
##########################################################################
DUT_SRC_DIR=../rtl/
SIM_SRC_DIR=../sim/

							\
_TARGETS_=      $(SIM_SRC_DIR)/timescale.v \
							\
		$(DUT_SRC_DIR)/ram.v \
							  \
		



##########################################################################
#
# Test Bench Sources
#
##########################################################################
_TOP_= ram_tb
#SIM_SRC_DIR=../sim
_TB_=		$(SIM_SRC_DIR)/ram_tb.v        \


##########################################################################
#
# Misc Variables
#
##########################################################################

INCDIR=+incdir+./$(SIM_SRC_DIR)/ +incdir+./$(SIM_SRC_DIR)/
LOGF=-l .nclog

##########################################################################
#
# Make Targets
#
##########################################################################

simw_old:
	@$(MAKE) $(MS) sim ACCESS="-ACCESS +rw " WAVES="-DEFINE WAVES"

ss:
	signalscan -do waves/waves.do -waves waves/waves.trn &


simw:
	$(MAKE) $(MS) sim ACCESS="+access+rw " WAVES="+define+WAVES"

sim:
	ncverilog +access+rwc -q +gui +define+RUDIS_TB $(_TARGETS_) $(_TB_)      \
		$(INCDIR) $(WAVES) $(ACCESS) $(LOGF) +ncstatus  \
		+ncuid+`hostname`

gatew:
	@$(MAKE) -s gate ACCESS="+access+r" WAVES="+define+WAVES"

gate:
	ncverilog -q +define+RUDIS_TB $(_TB_) $(UMC_LIB)        \
		$(GATE_NETLIST) $(INCDIR) $(WAVES) $(ACCESS)    \
		$(LOGF) +ncstatus +ncuid+`hostname`

simxl:
	verilog +incdir+$(SIM_SRC_DIR) +incdir+$(SIM_SRC_DIR)	\
	+access+r +define+WAVES $(_TARGETS_) $(_TB_)

clean:
	rm -rf	./waves/*.dsn ./waves/*.trn		\
		INCA_libs ncverilog.key			\
		./verilog.* .nclog hal.log

