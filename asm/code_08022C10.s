	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022C10
sub_08022C10: @ 0x08022C10
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022C34
	ldr r0, _08022C2C @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForSupport
	ldr r0, _08022C30 @ =0x08B95C18
	bl StartMapSelect
	movs r0, #7
	b _08022C3C
	.align 2, 0
_08022C2C: .4byte 0x03004690
_08022C30: .4byte 0x08B95C18
_08022C34:
	ldr r1, _08022C40 @ =0x0000073C
	bl MenuFrozenHelpBox
	movs r0, #8
_08022C3C:
	pop {r1}
	bx r1
	.align 2, 0
_08022C40: .4byte 0x0000073C
