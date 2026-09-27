	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08097A6C
sub_08097A6C: @ 0x08097A6C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097A98 @ =0x08CC3BDC
	bl Proc_Find
	adds r1, r4, #0
	adds r1, #0x33
	ldrb r1, [r1]
	adds r0, #0x31
	strb r1, [r0]
	adds r0, r4, #0
	bl EndAllProcChildren
	movs r0, #0
	bl EndFaceById
	bl EndMuralBackground_
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097A98: .4byte 0x08CC3BDC
