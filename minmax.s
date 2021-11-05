#
#	Name:		Castrillo, Carlos
#	Project:	Midterm
#	Due:		11/05/2021
#	Course:		cs-2640-02-f21
#
#	Description:
#				Find max and min of an array.
#
	.data
intro:	.asciiz	"Min Max by C. Castrillo\n\n"
mintext:
	.asciiz "Min =  "
maxtext:
	.asciiz "Max =  "
SIZE = 10
array:
	.word 43, 31, 19, 85, 66, 49, 78, 58, 77, 26

	.text
main:
	la		$a0, intro
	li		$v0, 4
	syscall
printarrayloop:
	li		$v0, 1
	la		$t0, array
	add		$t0, $t0, $t1
	lw		$a0, ($t0)
	syscall
	li		$a0, '\n'
	li		$v0, 11
	syscall
	addi	$t1, $t1, 4
	addi	$t2, $t2, 1
	blt		$t2, SIZE, printarrayloop
	syscall
	sub		$sp, $sp, 4
	sw		$ra, ($sp)
	la		$a0, array
	li		$a1, SIZE
	jal		minmax
	lw		$ra, ($sp)
	addi	$sp, $sp, 4
	move	$t0, $v0
	move	$t1, $v1
	la		$a0, mintext
	li		$v0, 4
	syscall
	move	$a0, $t0
	li		$v0, 1
	syscall
	li		$a0, '\n'
	li		$v0, 11
	syscall
	li		$v0, 4
	la		$a0, maxtext
	syscall
	move	$a0, $t1
	li		$v0, 1
	syscall
	jr		$ra

minmax:
	lw		$v0, ($a0)
	lw		$v1, ($a0)
dowhile:
	move	$s0, $a0
	add		$s0, $s0, $s2
	lw		$s3, ($s0)
	bge		$s3, $v0, check
	move	$v0, $s3
	b		continue
check:
	ble		$s3, $v1, continue
	move	$v1, $s3
continue:
	addi	$s1, $s1, 1
	addi	$s2, $s2, 4
	blt		$s1, $a1, dowhile
enddw:
	jr	$ra
