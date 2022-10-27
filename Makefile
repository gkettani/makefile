#Compiler flags
CC=gcc

#Project flags
C_FILES = $(wildcard src/*.c)
OBJS = $(C_FILES:src/%.c=build/%.o)
EXECS = $(C_FILES:src/%.c=bin/%)

all: $(EXECS)

$(EXECS): $(OBJS)
	$(CC) -g -o $@ build/$(@F).o

build:
	mkdir -p build
	mkdir -p bin

build/%.o: src/%.c | build
	$(CC) -c $< -o $@

clean:
	rm -f $(OBJS) $(EXECS)