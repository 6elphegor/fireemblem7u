	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069D18
sub_08069D18: @ 0x08069D18
	ldr r0, _08069D38 @ =0x0202BBB8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _08069D3C @ =0x0201FB24
	ldr r2, _08069D40 @ =0x0201FDB0
	cmp r0, #0
	beq _08069D84
	ldr r1, _08069D44 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _08069D4C
	movs r0, #0
	str r0, [r1]
	ldr r0, _08069D48 @ =0x0201FB2C
	b _08069D52
	.align 2, 0
_08069D38: .4byte 0x0202BBB8
_08069D3C: .4byte 0x0201FB24
_08069D40: .4byte 0x0201FDB0
_08069D44: .4byte 0x0201FB20
_08069D48: .4byte 0x0201FB2C
_08069D4C:
	movs r0, #1
	str r0, [r1]
	ldr r0, _08069D68 @ =0x0201FC6C
_08069D52:
	str r0, [r3]
	ldr r1, _08069D6C @ =0x0201FDAC
	ldr r0, [r1]
	cmp r0, #1
	bne _08069D78
	movs r0, #0
	str r0, [r1]
	ldr r1, _08069D70 @ =0x0201FDB0
	ldr r0, _08069D74 @ =0x0201FDB8
	b _08069D80
	.align 2, 0
_08069D68: .4byte 0x0201FC6C
_08069D6C: .4byte 0x0201FDAC
_08069D70: .4byte 0x0201FDB0
_08069D74: .4byte 0x0201FDB8
_08069D78:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08069D94 @ =0x0201FDB0
	ldr r0, _08069D98 @ =0x0201FEF8
_08069D80:
	str r0, [r1]
	adds r2, r1, #0
_08069D84:
	ldr r1, _08069D9C @ =0x0201FB28
	ldr r0, [r3]
	str r0, [r1]
	ldr r1, _08069DA0 @ =0x0201FDB4
	ldr r0, [r2]
	str r0, [r1]
	bx lr
	.align 2, 0
_08069D94: .4byte 0x0201FDB0
_08069D98: .4byte 0x0201FEF8
_08069D9C: .4byte 0x0201FB28
_08069DA0: .4byte 0x0201FDB4
