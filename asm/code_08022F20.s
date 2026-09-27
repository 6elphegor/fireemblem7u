	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022F20
sub_08022F20: @ 0x08022F20
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r1, [r1]
	cmp r1, #2
	bne _08022F5C
	ldr r0, _08022F44 @ =0x03004690
	ldr r0, [r0]
	bl IsUnitMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08022F4C
	ldr r1, _08022F48 @ =0x0000073D
	adds r0, r4, #0
	bl MenuFrozenHelpBox
	b _08022F54
	.align 2, 0
_08022F44: .4byte 0x03004690
_08022F48: .4byte 0x0000073D
_08022F4C:
	ldr r1, _08022F58 @ =0x0000073E
	adds r0, r4, #0
	bl MenuFrozenHelpBox
_08022F54:
	movs r0, #8
	b _08022F62
	.align 2, 0
_08022F58: .4byte 0x0000073E
_08022F5C:
	bl sub_080B267C
	movs r0, #0x17
_08022F62:
	pop {r4}
	pop {r1}
	bx r1
