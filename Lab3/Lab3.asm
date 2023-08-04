.macro exit #macro to exit program
		li a7, 10
		ecall
		.end_macro	

.macro print_str(%string1) #macro to print any string
	li a7,4 
	la a0, %string1
	ecall
	.end_macro
	
.macro print_int (%x)  #macro to print any integer or register
	li a7, 1
	add a0, zero, %x
	#zero here refers to register #0
	#the zero register always has constant value of 0
	ecall
	.end_macro


.data
	prompt: .asciz  "Enter the height of the pattern (must be greater than 0):"
	invalid: .asciz "Invalid Entry!"
	newline: .asciz  "\n"  #this prints a newline
	star: .asciz "*"
	dollar: .asciz "$"
	
.text
	
main: 
	top:
	print_str(prompt)

#reading integer n1
	li a7, 5
	ecall 	
		
#set t3->n1
	addi t3, a0, 0

#print error branch
	bgtz a0, outer_loop
	print_str(invalid)
	print_str(newline)
	
#jump to main if is negative or 0
	b top

#printing pattern of "$n1"
	outer_loop:
	li t0, 0
	li t2, -1
	mv t1, t3
	loop:
		addi t0,t0, 1 #increment the counter by 1
		addi t2, t2, 2 #increment the print_counter by 2

		bgt t0, t1, exit2
		#printing pattern of $*
		inner_loop:
			li t4, 1
			mv t5, t0
		loop2:
			addi t4, t4, 1
			bgt t4, t5, exit
			print_str(dollar)
			print_str(star)
			j loop2
		exit: 
		print_str(dollar)
		print_int(t2)
		print_str(newline)
		j loop
	exit2: