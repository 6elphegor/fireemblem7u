	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A95C
sub_0807A95C: @ 0x0807A95C
	push {lr}
	adds r2, r0, #0
	adds r2, #0x4c
	ldrb r3, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0807A982
	movs r0, #0xff
	strb r0, [r2]
	bl RefreshBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
	b _0807A986
_0807A982:
	bl RefreshBMapGraphics
_0807A986:
	pop {r0}
	bx r0
	.align 2, 0
