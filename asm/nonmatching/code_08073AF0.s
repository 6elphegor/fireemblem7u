	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073AF0
sub_08073AF0: @ 0x08073AF0
	push {r4, r7, lr}
	mov r7, sp
	ldr r0, _08073B10 @ =0x0203A85C
	ldrb r1, [r0, #0xc]
	adds r0, r1, #0
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #1
	bics r0, r1
	str r0, [r4, #0xc]
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073B10: .4byte 0x0203A85C
