	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022FC8
sub_08022FC8: @ 0x08022FC8
	push {lr}
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	beq _08022FF0
	bl ClearUi
	ldr r0, _08022FE8 @ =0x03004690
	ldr r0, [r0]
	bl MakeTargetListForSteal
	ldr r0, _08022FEC @ =0x08B95BF8
	bl StartMapSelect
	movs r0, #7
	b _08022FF8
	.align 2, 0
_08022FE8: .4byte 0x03004690
_08022FEC: .4byte 0x08B95BF8
_08022FF0:
	ldr r1, _08022FFC @ =0x0000074B
	bl MenuFrozenHelpBox
	movs r0, #8
_08022FF8:
	pop {r1}
	bx r1
	.align 2, 0
_08022FFC: .4byte 0x0000074B
