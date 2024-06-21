# Makefile
#
# $Id$
#

OSFLAGS  = -DOS_LINUX -Dextname
CFLAGS   = -g -O2 -fPIC -Wall -Wuninitialized -I. -I$(MIDASSYS)/include
CXXFLAGS = $(CFLAGS)

LIBS = -lm -lz -lutil -lnsl -lpthread -lrt
LIB_DIR         = $(MIDASSYS)/linux/lib

# MIDAS library
MIDASLIBS = $(MIDASSYS)/linux/lib/libmidas.a

#R76 stuff
R76LIBS = -L ~/git/R76Firmware/library/C/lib/gcc/ -lR76Firmware -L ~/git/R76Firmware/library/C/lib/gcc -lUniversalTriggerShared -L ~/git/R76Firmware/r5560_sdk/linux/ -lr5560
R76FLAGS = $(R76LIBS) -I~/git/R76Firmware/library/C/lib/src/ -I~/git/R76Firmware/library/C/lib/src/Legacy/

# ROOT library
ifdef ROOTSYS
CXXFLAGS += -DHAVE_ROOT -I$(ROOTSYS)/include -I$(ROOTSYS)/include/root
#ROOTGLIBS = $(shell $(ROOTSYS)/bin/root-config --glibs) -lThread -Wl,-rpath,$(ROOTSYS)/lib/root
ROOTGLIBS = $(shell $(ROOTSYS)/bin/root-config --glibs) -lThread -Wl,-rpath,$(shell $(ROOTSYS)/bin/root-config --libdir)
LIBS += $(ROOTGLIBS)
endif

all:: dcrc_driver.exe towerfe.exe lock_manager.exe towerfe2.exe towerfe3.exe triggerfe2.exe triggerfe2_mod.exe towerfe3_NaI.exe

dcrc_driver.exe: %.exe: %.o update_general_functions.o update_trigger_functions.o update_led_functions.o update_test_signal_functions.o update_phonon_functions.o update_charge_functions.o convert_functions.o utils1.o write_DCRC.o  KOsocket.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

towerfe.exe: %.exe:   %.o  KOsocket.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

lock_manager.exe: %.exe:   %.o utils1.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

towerfe2.exe: %.exe:   %.o  KOsocket.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

towerfe3.exe: %.exe:   %.o  KOsocket.o utils1.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

#Experimental - NaI firmware integration.
towerfe3_NaI.exe: %.exe:   %.o  KOsocket.o utils1.o
	echo $(R76FLAGS)
	$(CXX) -g3 -fPIC -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS) -lstdc++ -ldl
	#-std=gnu99 -shared

triggerfe2.exe: %.exe:   %.o utils1.o ran1.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

triggerfe2_test.exe: %.exe:   %.o  KOsocket.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

triggerfe2_mod.exe: %.exe:   %.o utils1.o ran1.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

feSlowControl.exe: %.exe:   %.o  KOsocket.o
	$(CXX) -o $@ $(CFLAGS) $(OSFLAGS) $^ $(MIDASLIBS) $(LIB_DIR)/mfe.o $(MIDASLIBS) $(LIBS)

KOsocket_NaI.o: KOsocket_NaI.cxx
	gcc -fPIC -std=gnu99 $(CXXFLAGS) $(OSFLAGS) -c $< -lstdc++

%.o: %.cxx
	$(CXX) $(CXXFLAGS) $(OSFLAGS) -c $<

%.o: %.c
	$(CXX) $(CXXFLAGS) $(OSFLAGS) -c $<

clean::
	-rm -f *.o *.exe

R76clean::
	-rm -f *_NaI.o *_NaI.exe

# end
