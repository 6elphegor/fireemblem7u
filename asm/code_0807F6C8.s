	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F6C8
sub_0807F6C8: @ 0x0807F6C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x98
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0807F6E4
	movs r0, #0x98
	bl SetFlag
	adds r0, r4, #0
	bl sub_080A4E0C
_0807F6E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
