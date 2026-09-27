	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenu_SetDifficultyChoice
SaveMenu_SetDifficultyChoice: @ 0x080A4E34
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080A4E54 @ =0x08CE3C54
	bl Proc_Find
	cmp r0, #0
	beq _080A4E4E
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	adds r0, #0x3d
	strb r5, [r0]
_080A4E4E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4E54: .4byte 0x08CE3C54
