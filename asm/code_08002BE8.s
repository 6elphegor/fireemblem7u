	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBgTilemap
GetBgTilemap: @ 0x08002BE8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002C00 @ =0x08B85814
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _08002C04
	.align 2, 0
_08002C00: .4byte 0x08B85814
_08002C04:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
