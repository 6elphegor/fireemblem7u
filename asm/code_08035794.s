	.include "macro.inc"

	.syntax unified

	thumb_func_start AiEscapeAction
AiEscapeAction: @ 0x08035794
	push {lr}
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080357A6
	movs r0, #0
	b _080357AE
_080357A6:
	ldr r0, _080357B4 @ =0x03004690
	ldr r0, [r0]
	str r1, [r0]
	movs r0, #1
_080357AE:
	pop {r1}
	bx r1
	.align 2, 0
_080357B4: .4byte 0x03004690
