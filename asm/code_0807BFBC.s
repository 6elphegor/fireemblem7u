	.include "macro.inc"

	.syntax unified

	thumb_func_start QuintessenceFx_ParallelWorker
QuintessenceFx_ParallelWorker: @ 0x0807BFBC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	movs r0, #1
	movs r1, #0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r6, #0x3c
	str r6, [sp, #4]
	movs r5, #0x10
	str r5, [sp, #8]
	movs r2, #3
	movs r3, #2
	bl ScanlineRotation
	movs r0, #1
	movs r1, #0xa0
	bl GetScanlineBuf
	ldr r1, [r4, #0x58]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r2, r8
	str r2, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #2
	movs r3, #4
	bl ScanlineRotation
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
