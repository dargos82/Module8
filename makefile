All: calculateKPH calculateCToF calculateFeet
LIB=libConversions.o
CC=gcc

calculateKPH: calculateKPH.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

calculateCToF: calculateCToF.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

calculateFeet: calculateFeet.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
