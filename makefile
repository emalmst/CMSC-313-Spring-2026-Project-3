
project3:
	gcc project3.c -o Dumper
	gcc project3.c -O0 -S -o optimization0.s
	gcc project3.c -O1 -S -o optimization1.s
	gcc project3.c -O3 -S -o optimization3.s
	./Dumper binary.out
