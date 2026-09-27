	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099858
sub_08099858: @ 0x08099858
	adds r2, r0, #0
	ldr r3, _08099878 @ =0x0202BBF8
	adds r1, r3, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0809988C
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _08099880
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809987C @ =0x00000F97
	b _080998A6
	.align 2, 0
_08099878: .4byte 0x0202BBF8
_0809987C: .4byte 0x00000F97
_08099880:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _08099888 @ =0x00000F8B
	b _080998A6
	.align 2, 0
_08099888: .4byte 0x00000F8B
_0809988C:
	ldrb r3, [r3, #0x1b]
	cmp r3, #3
	bne _080998A0
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _0809989C @ =0x00000F9D
	b _080998A6
	.align 2, 0
_0809989C: .4byte 0x00000F9D
_080998A0:
	adds r1, r2, #0
	adds r1, #0x39
	ldr r0, _080998B0 @ =0x00000F91
_080998A6:
	ldrb r1, [r1]
	subs r0, r0, r1
	str r0, [r2, #0x30]
	bx lr
	.align 2, 0
_080998B0: .4byte 0x00000F91
