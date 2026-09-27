	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A98C
sub_0807A98C: @ 0x0807A98C
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807A9B2
	movs r0, #0xff
	strb r0, [r2]
	bl InitMoreBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	b _0807A9B6
_0807A9B2:
	bl InitMoreBMapGraphics
_0807A9B6:
	pop {r0}
	bx r0
	.align 2, 0
