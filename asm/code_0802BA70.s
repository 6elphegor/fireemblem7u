	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTrapAt
GetTrapAt: @ 0x0802BA70
	adds r3, r0, #0
	ldr r2, _0802BA78 @ =0x0203A518
	b _0802BA8E
	.align 2, 0
_0802BA78: .4byte 0x0203A518
_0802BA7C:
	ldrb r0, [r2]
	cmp r3, r0
	bne _0802BA8C
	ldrb r0, [r2, #1]
	cmp r1, r0
	bne _0802BA8C
	adds r0, r2, #0
	b _0802BA96
_0802BA8C:
	adds r2, #8
_0802BA8E:
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BA7C
	movs r0, #0
_0802BA96:
	bx lr
