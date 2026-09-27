	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetUnitSpritesB
ResetUnitSpritesB: @ 0x08024D2C
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _08024D54 @ =0x02039F18
	ldr r6, _08024D58 @ =0x02039F14
	ldr r4, _08024D5C @ =0x02033E44
	movs r3, #0xff
_08024D38:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08024D38
	movs r0, #0
	str r0, [r5]
	movs r0, #0x5f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024D54: .4byte 0x02039F18
_08024D58: .4byte 0x02039F14
_08024D5C: .4byte 0x02033E44
