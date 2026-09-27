	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08012A70
sub_08012A70: @ 0x08012A70
	push {lr}
	movs r0, #0
	bl InitBgs
	ldr r0, _08012A88 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _08012A8C
	cmp r0, #3
	beq _08012A98
	b _08012A9E
	.align 2, 0
_08012A88: .4byte 0x0202BBF8
_08012A8C:
	ldr r0, _08012A94 @ =0x08CC1B1C
	bl sub_0800AF5C
	b _08012A9E
	.align 2, 0
_08012A94: .4byte 0x08CC1B1C
_08012A98:
	ldr r0, _08012AA4 @ =0x08CC1B50
	bl sub_0800AF5C
_08012A9E:
	pop {r0}
	bx r0
	.align 2, 0
_08012AA4: .4byte 0x08CC1B50
