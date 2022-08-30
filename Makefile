
CC=gcc
CFLAGS=-I.
DEPS = hellomake.h
OBJ = hellomake.o hellofunc.o 

main:
	"C:\masm32\bin\ml" prog1.asm /c /coff /Cp 
	C:\masm32\bin\link -entry:main /subsystem:console prog1.obj
	prog1

hellomake: hellomake.c hellofunc.c
	gcc -o hellomake hellomake.c hellofunc.c -I.

hellomake2: hellomake.o hellofunc.o
	$(CC) -o hellomake hellomake.o hellofunc.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake3: hellomake.o hellofunc.o 
	$(CC) -o hellomake hellomake.o hellofunc.o

hellomake4: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o

Compilation:
	gcc -­E helloWorld.c > helloWorld.i
	gcc ­-S -masm=intel helloWorld.c
	as -o helloWorld.o helloWorld.s
	ld -o helloWorld.exe helloWorld.o
