NAME=main
CFLAGS=-g -Wall -o $(NAME)
GTKFLAGS=-export-dynamic `pkg-config --cflags --libs gtk+-2.0`
SRCS=main.cpp
CC=g++

all: $(NAME)
  
main: $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) $(GTKFLAGS)
 
clean:
	/bin/rm -f $(NAME)
