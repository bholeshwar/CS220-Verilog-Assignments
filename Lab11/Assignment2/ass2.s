arrayA: .space 60
arrayB: .space 60

	   .text
	   .globl main
main:  li $v0, 5		  # read_int
	   syscall			  # reads n
 	   add $t0, $v0, $0    # stores n in $t0
 	   add $t1, $v0, $0	  # makes a copy of n in $t1

 	   la $t2, arrayA      # $t2 <- arrayA

scanA: li $v0, 6		  # read_float
	   syscall			  # reads A[i]
	   s.s $f0, 0($t2)	  # *A <- $v0
	   addi $t2, $t2, 4   # A++
	   addi $t1, $t1, -1  # n--
	   bne $t1, $0, scanA
	   la $t2, arrayA	  # $t2 <- arrayA

	   add $t1, $t0, $0   # copy of n in $t1
	   la $t3, arrayB     # $t3 <- arrayB

scanB: li $v0, 6		  # read_float
	   syscall			  # reads B[i]
	   s.s $f0, 0($t3)	  # *B <- $v0
	   addi $t3, $t3, 4   # B++
	   addi $t1, $t1, -1  # n--
	   bne $t1, $0, scanB
	   la $t3, arrayB	  # $t3 <- arrayB

	   neg.s $f4, $f4       # $f4 contains the ans

dot:   l.s $f1, 0($t2)	  # loads A[i]
	   l.s $f2, 0($t3)	  # loads B[i]
	   mul.s $f3, $f1, $f2 # A[n-i]*B[n-i]
	   add.s $f4, $f4, $f3  # sigma (A[n-i]*B[n-i])
	   addi $t2, $t2, 4  # A++
	   addi $t3, $t3, 4  # B++
	   addi $t0, $t0, -1  # n--
	   bne $t0, $0, dot

	   li $v0, 2		  # print_float
	   mov.s $f12, $f4    # stores the ans in $f12
	   syscall			  # prints the ans

	   jr $ra