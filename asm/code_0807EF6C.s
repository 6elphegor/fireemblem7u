	.include "macro.inc"

	.syntax unified

	thumb_func_start IsHectorInCombat
IsHectorInCombat: @ 0x0807EF6C
	ldr r0, _0807EF84 @ =0x0203A3F0
	ldr r1, [r0]
	ldr r0, _0807EF88 @ =0x0203A470
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r1, #2
	beq _0807EF80
	cmp r0, #2
	bne _0807EF8C
_0807EF80:
	movs r0, #1
	b _0807EF8E
	.align 2, 0
_0807EF84: .4byte 0x0203A3F0
_0807EF88: .4byte 0x0203A470
_0807EF8C:
	movs r0, #0
_0807EF8E:
	bx lr
