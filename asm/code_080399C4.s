	.include "macro.inc"

	.syntax unified

	thumb_func_start AiCanEquip
AiCanEquip: @ 0x080399C4
	ldr r0, _080399EC @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _080399F4
	ldr r0, _080399F0 @ =0x0203A97C
	ldrb r0, [r0]
	cmp r0, #1
	beq _080399F4
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _080399F4
	movs r0, #1
	b _080399F6
	.align 2, 0
_080399EC: .4byte 0x03004690
_080399F0: .4byte 0x0203A97C
_080399F4:
	movs r0, #0
_080399F6:
	bx lr
