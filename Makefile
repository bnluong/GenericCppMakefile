SRCDIR := src
BINDIR := bin
HDRDIR := header
OBJDIR := obj
EXEC := #PROGRAM_NAME"
INCLUDE := -I $(HDRDIR)
CXX := g++
STD := -std=c++11
CXXFLAGS := $(STD) $(INCLUDE)

SRCFILES := $(shell find $(SRCDIR) -type f -name *.cpp)
# SRCFILES finds all source .cpp in SRCDIR
OBJFILES := $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCFILES))
# OBJFILES replaces .cpp with .o

all: compile $(EXEC)

compile: 
	mkdir -p $(BINDIR) $(OBJDIR)
	
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)
$(EXEC): $(OBJFILES)
	$(CXX) $^ -o $(BINDIR)/$@
	echo "The program was compiled successfully."

clean:
	/bin/rm -rf $(BINDIR) $(OBJDIR)
run:
	$(BINDIR)/$(EXEC)
