CC = g++
CXXFLAGS = --compiler-options -Wall --compiler-options -Wextra -O2 --expt-extended-lambda -lgmp -std=c++17 -I ../include -dc
BIN = ../bin
BINNAME = libmith.a
DIST = ../dist

SRCS = Int.cu
OBJS = $(subst .o ,.o $(DIST)/,$(DIST)/$(SRCS:%.cpp=%.o))

.PHONY: all
all: $(SRCS) $(BIN)/$(BINNAME)

$(BIN)/$(BINNAME): $(OBJS)
	$(CC) -o $@ -lib $^

$(DIST)/%.o: %.cu
	$(CC) -c $(CXXFLAGS) $*.cu -o $(DIST)/$*.o
	$(CC) -dlink $(CXXFLAGS) $(DIST)/$*.o -o $(DIST)/$*.o
