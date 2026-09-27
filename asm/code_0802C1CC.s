	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802C1CC
sub_0802C1CC: @ 0x0802C1CC
	push {lr}
	movs r0, #0x65
	bl CheckChapterFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C1E0
	ldr r0, _0802C1E4 @ =0x08CA749C
	bl sub_0800AF5C
_0802C1E0:
	pop {r0}
	bx r0
	.align 2, 0
_0802C1E4: .4byte 0x08CA749C
