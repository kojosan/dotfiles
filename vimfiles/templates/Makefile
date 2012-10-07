# Makefile for C++

#------------------------------------------------------
# Parameters
#------------------------------------------------------

TARGET = a

CPPFLAGS = -O3 -std=c++0x
LDFLAGS = 

INSTALLDIR = ~/local/bin/

INCS = -I/opt/local/include -I$(HOME)/local/include
LIBS = -L/opt/local/lib -L$(HOME)/local/lib

#------------------------------------------------------
# Definition
#------------------------------------------------------

# CXX = g++

SRCEXTS = .cpp
HEDEXTS = .h .hpp

SRCDIRS = src
OBJDIR  = obj
ifeq ($(SRCDIRS),)
  SRCDIRS = .
endif
ifeq ($(OBJDIR),)
  OBJDIR = .
endif

SRCS = $(foreach d,$(SRCDIRS),$(wildcard $(addprefix $(d)/*,$(SRCEXTS))))
HEDS = $(foreach d,$(SRCDIRS),$(wildcard $(addprefix $(d)/*,$(HDREXTS))))
OBJS = $(addprefix $(OBJDIR)/,$(addsuffix .o,$(notdir $(basename $(SRCS)))))
DEPS = $(OBJS:.o=.d)

COMPILE.cpp = $(CXX) $(CPPFLAGS) $(INCS) -c
LINK.cpp    = $(CXX) $(CPPFLAGS) $(LDFLAGS)

.SUFFIXES:

#------------------------------------------------------
# rules
#------------------------------------------------------

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LINK.cpp) $< $(LIBS) -o $@

$(OBJS): $(SRCS) | _objdir
	$(COMPILE.cpp) $< -o $@

_objdir:
	mkdir -p $(OBJDIR)

install: $(TARGET)
	cp $< $(INSTALLDIR)

dep:
	$(CXX) -MM -MG $(SRCS) >makefile.depend

clean:
	rm -f $(OBJS) $(TARGET)

tar:
	tar cvzf $(TARGET).tar.gz $(SRCS) $(HEDS) Makefile

#--------------------------------------------------
-include makefile.depend


