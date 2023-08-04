#Note that this file only contains a function xyCoordinatesToAddress
#As such, this function should work independent of any caller funmction which calls it
#When using regisetrs, you HAVE to make sure they follow the register usage convention in RISC-V as discussed in lectures.
#Else, your function can potentially fail when used by the autograder and in such a context, you will receive a 0 score for this part

xyCoordinatesToAddress:
	#(x,y) in (a0,a1) arguments
	#a2 argument contains base address
	#returns pixel address in a0
	
	#make sure to return to calling function after putting correct value in a0!
	#Enter code below!DO NOT MODIFY ANYTHING BEFORE THIS COMMENT LINE!
	#slli a , b , c   is means that  a = b(c^c)
	slli a0, a0, 2
	slli a1, a1, 7
	add a1 , a1, a0
	add a2, a2, a1
	addi a0, a2, 0
	ret
		
					
