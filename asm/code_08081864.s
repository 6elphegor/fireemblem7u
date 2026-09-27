	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08081864
sub_08081864: @ 0x08081864
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #5
	bl UpdateHelpBoxDisplay
	adds r2, r4, #0
	adds r2, #0x48
	adds r4, #0x4a
	ldrh r3, [r2]
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r5, #0
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _08081886
	adds r0, r3, #1
	strh r0, [r2]
_08081886:
	pop {r4, r5}
	pop {r0}
	bx r0
