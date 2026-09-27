	.include "macro.inc"

	.syntax unified

	thumb_func_start XMapTransfer_80483F8
XMapTransfer_80483F8: @ 0x08042D90
	push {lr}
	adds r1, r0, #0
	ldr r0, _08042DAC @ =0x08B98AEC
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #3
	bls _08042DA6
	adds r0, r1, #0
	movs r1, #0
	bl EventGotoLabel
_08042DA6:
	pop {r0}
	bx r0
	.align 2, 0
_08042DAC: .4byte 0x08B98AEC
