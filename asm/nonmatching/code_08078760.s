	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckActiveUnitArea
CheckActiveUnitArea: @ 0x08078760
	push {r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	ldr r1, _08078788 @ =0x03004690
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	cmp r1, r0
	blt _0807878C
	cmp r1, r4
	bgt _0807878C
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	cmp r1, r5
	blt _0807878C
	cmp r1, r3
	bgt _0807878C
	movs r0, #1
	b _0807878E
	.align 2, 0
_08078788: .4byte 0x03004690
_0807878C:
	movs r0, #0
_0807878E:
	pop {r4, r5}
	pop {r1}
	bx r1
