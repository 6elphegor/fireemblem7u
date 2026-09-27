	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046994
sub_08046994: @ 0x08046994
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080469C0 @ =0x0300141C
	ldrb r0, [r0, #1]
	bl GetUnit
	adds r1, r0, #0
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	lsls r0, r0, #4
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	movs r2, #2
	adds r3, r4, #0
	bl StartAiTargetCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080469C0: .4byte 0x0300141C
