	.include "macro.inc"

	.syntax unified

	thumb_func_start DisableAllLightRunes
DisableAllLightRunes: @ 0x0802C29C
	push {r4, lr}
	ldr r4, _0802C2A4 @ =0x0203A518
	b _0802C2CA
	.align 2, 0
_0802C2A4: .4byte 0x0203A518
_0802C2A8:
	ldrb r0, [r4, #2]
	cmp r0, #0xc
	bne _0802C2C8
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetTrueTerrainAt
	ldr r1, _0802C2D8 @ =0x0202E3E0
	ldr r2, [r1]
	ldrb r3, [r4, #1]
	lsls r1, r3, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldrb r2, [r4]
	adds r1, r2, r1
	strb r0, [r1]
_0802C2C8:
	adds r4, #8
_0802C2CA:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C2A8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C2D8: .4byte 0x0202E3E0
