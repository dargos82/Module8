All: calculateKPH
LIB=libConversions.o
CC=gcc

calculateKPH: calculateKPH.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
