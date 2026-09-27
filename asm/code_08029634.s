	.include "macro.inc"

	.syntax unified

	thumb_func_start CanBattleUnitGainLevels
CanBattleUnitGainLevels: @ 0x08029634
	adds r2, r0, #0
	ldr r1, _08029658 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08029652
	ldrb r0, [r2, #9]
	cmp r0, #0xff
	beq _0802965C
	movs r0, #0xc0
	ldrb r2, [r2, #0xb]
	ands r0, r2
	cmp r0, #0
	bne _0802965C
_08029652:
	movs r0, #1
	b _0802965E
	.align 2, 0
_08029658: .4byte 0x0202BBB8
_0802965C:
	movs r0, #0
_0802965E:
	bx lr
