	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08034FF0
sub_08034FF0: @ 0x08034FF0
	push {lr}
	ldr r1, _08035008 @ =0x0203A8EC
	adds r1, #0x7b
	movs r0, #4
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08035004
	bl AiTryDoSpecialItems
_08035004:
	pop {r0}
	bx r0
	.align 2, 0
_08035008: .4byte 0x0203A8EC
