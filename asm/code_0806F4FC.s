	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackManimWindowDigits
UnpackManimWindowDigits: @ 0x0806F4FC
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r4, _0806F52C @ =0x083F3FA4
	movs r0, #0
	bl GetBgChrOffset
	ldr r1, [r7]
	lsls r2, r1, #0x16
	lsrs r1, r2, #0x16
	lsls r2, r1, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r2, r3
	adds r2, r0, r1
	adds r0, r4, #0
	adds r1, r2, #0
	bl Decompress
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806F52C: .4byte 0x083F3FA4
