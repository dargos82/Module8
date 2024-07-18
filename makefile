All: miles2kilometers CToF InchesToFt
LIB=libConversions.s
CC=gcc

miles2kilometers: miles2kilometers.o $(LIB)
	$(CC) $@.0 $(LIB) -g -o $@

CToF: CToF.o $(LIB)
	$(CC) $@.0 $(LIB) -g -o $@

InchesToFt: InchesToFt.o $(LIB)
	$(CC) $@.0 $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.0=.s) -g -c -o $@
