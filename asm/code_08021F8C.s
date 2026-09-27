	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021F8C
sub_08021F8C: @ 0x08021F8C
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08021FA4
	ldr r1, _08021FA0 @ =0x0203A85C
	movs r0, #0xe
	strb r0, [r1, #0x11]
	movs r0, #0x17
	b _08021FAC
	.align 2, 0
_08021FA0: .4byte 0x0203A85C
_08021FA4:
	ldr r1, _08021FB0 @ =0x00000736
	bl MenuFrozenHelpBox
	movs r0, #8
_08021FAC:
	pop {r1}
	bx r1
	.align 2, 0
_08021FB0: .4byte 0x00000736
