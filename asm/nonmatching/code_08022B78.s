	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022B78
sub_08022B78: @ 0x08022B78
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022B9C
	ldr r0, _08022B94 @ =0x03004690
	ldr r0, [r0]
	bl sub_08024094
	ldr r0, _08022B98 @ =0x08B95C38
	bl StartMapSelect
	movs r0, #7
	b _08022BA4
	.align 2, 0
_08022B94: .4byte 0x03004690
_08022B98: .4byte 0x08B95C38
_08022B9C:
	ldr r1, _08022BA8 @ =0x0000073C
	bl MenuFrozenHelpBox
	movs r0, #8
_08022BA4:
	pop {r1}
	bx r1
	.align 2, 0
_08022BA8: .4byte 0x0000073C
