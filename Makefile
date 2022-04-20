CC = g++
SRC = src
INCLUDE = ./include
BIN = ./bin
BINNAME = bin
DIST = ./dist
TEST = ./test

.PHONY: all
all: $(INCLUDE) $(BIN) $(DIST)
	cd $(SRC) && make

$(BIN):
	mkdir $(BIN)

$(DIST):
	mkdir $(DIST)

.PHONY: run
run:
	make
	$(BIN)/$(BINNAME)

.PHONY: clean
clean:
	rm -rf $(BIN)
	rm -rf $(DIST)

$(TEST)/%.cu: $(INCLUDE) $(BIN) $(DIST)
	cd $(SRC) && make ../$(TEST)/$*.cpp

.PHONY: test
test:
	$(CC) $(target) -L$(BIN) -lgmp -lmith --expt-extended-lambda -I$(INCLUDE) -o $(BIN)/$(BINNAME)
