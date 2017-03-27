# Simple C makefile used to build and link
# all .c files in the current folder.
#
# change TARGET to the desired output name
# and you're good to go.
#

# Compiler settings
CC = gcc
CFLAGS = -g -Wall
OPT = 0

TARGET  = baz
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)
HEADERS = *.h

.PHONY: default all clean

default: $(TARGET)

$(TARGET):$(OBJECTS)
	gcc $^ -o $(TARGET)

clean:
	-rm -f *.o
	-rm -f $(TARGET)

