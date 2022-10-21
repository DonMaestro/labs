#.include "nios_macros.s"
.global __mulsi3
.global _start
_start:
	movia	r6, AVECTOR /* Register r6 is a pointer to vector A */
	movia	r7, BVECTOR /* Register r7 is a pointer to vector B */
	movia	r8, N
	ldw	r8, 0(r8) /*Register r8 is used as the counter for loop iterations*/
	add	r9, r0, r0 /* Register r9 is used to accumulate the product */
LOOP:
	ldw	r4, 0(r6) /* Load the next element of vector A */
	ldw	r5, 0(r7) /* Load the next element of vector B */
	/* __mulsi3 r2, r4, r5 */
	call	__mulsi3 /* Compute the product of next pair of elements */
	add	r9, r9, r2 /* Add to the sum */
	addi	r6, r6, 4 /* Increment the pointer to vector A */
	addi	r7, r7, 4 /* Increment the pointer to vector B */
	subi	r8, r8, 1 /* Decrement the counter */
	bgt	r8, r0, LOOP /* Loop again if not finished */
	stw	r9, DOT_PRODUCT(r0) /* Store the result in memory */
STOP:
	br	STOP
N:
.word 6 /* Specify the number of elements */
AVECTOR:
.word 5, 3, -6, 19, 8, 12 /* Specify the elements of vector A */
BVECTOR:
.word 2, 14, -3, 2, -5, 36 /* Specify the elements of vector B */
DOT_PRODUCT:
.skip 4

