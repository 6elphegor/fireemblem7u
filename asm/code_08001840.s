	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBlankChr
SetBlankChr: @ 0x08001840
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	lsls r0, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r0, r2
	movs r0, #0
	movs r2, #0x20
	bl RegisterDataFill
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
