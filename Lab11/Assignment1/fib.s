	   .data
comma: .asciiz ", "

	   .text
	   .globl main

main:  li $v0, 5			# read_int
	   syscall      		# reads n
	   add $t0, $v0, $0 	# stores n in $t0
	   addi $t1, $0, 1		# fib 1 (a)
	   addi $t2, $0, 1		# fib 2 (b)

fib:   li $v0, 1			# print_int
	   add $a0, $t1, $0		# prints fib n-2
	   syscall   			# prints int
	   addi $t0, $t0, -1    # n--
	   add $t3, $t1, $0		# temp($t3) = a
	   add $t1, $t2, $0		# a = b
	   add $t2, $t3, $t2	# b = b + a
	   li $v0, 4			# print_string
	   la $a0, comma		# loads address
	   syscall				# prints comma
	   bne $t0, $0, fib		# loop

	   jr $ra