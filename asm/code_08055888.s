	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSpellAnimation
StartSpellAnimation: @ 0x08055888
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080558B0 @ =0x0203E024
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldr r1, _080558B4 @ =0x08BA13D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080558B0: .4byte 0x0203E024
_080558B4: .4byte 0x08BA13D0
