

##
## Check for ROOT installation
ROOTCONFIG:=$(shell which root-config)
ifndef ROOTCONFIG
MAKEDICT+=$(shell rm -f AmeDict.h AmeDict.cxx)
MAKEDICT+=$(shell echo '' >AmeDict.h)
MAKEDICT+=$(shell echo '\#include "AmeDict.h"\nnamespace {void dummy() {}}' >AmeDict.cxx)
else
CXXFLAGS+=-DHAVE_ROOTSYS
ROOTLIBS=$(shell root-config --libs --glibs) -lXMLParser -lThread -lTreePlayer -lSpectrum -lMinuit
INCFLAGS+=$(shell root-config --cflags --noauxcflags)
MAKEDICT=rootcint -f $@ -c $(CXXFLAGS) -p $^
endif

##
## Check if OS/X or Linux
UNAME=$(shell uname)
ifeq ($(UNAME),Darwin)
DYLIB=-dynamiclib -single_module -undefined dynamic_lookup
else
DYLIB=-shared
FPIC=-fPIC 
endif

CXXFLAGS += $(INCFLAGS) $(FPIC) -DAMEPP_DEFAULT_FILE=\"$(PWD)/mass.mas12\"


HEADERS=TAtomicMass.h
OBJECTS=TAtomicMass.o





all: example

example: example.cxx libAme.so
	c++ -o $@ $< $(CXXFLAGS) -L$(PWD) -lAme $(ROOTLIBS)

libAme.so: $(OBJECTS) AmeDict.cxx
	c++ -o $@ $^ $(DYLIB) $(CXXFLAGS)

AmeDict.cxx: $(HEADERS) AmeLinkdef.h
	$(MAKEDICT)

%.o: %.cxx %.h
	c++ -c $(CXXFLAGS) $<

doc::
	doxygen Doxyfile

clean:
	rm -f AmeDict.* *.o *.so *.a