	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08011430
sub_08011430: @ 0x08011430
	push {lr}
	ldr r2, _08011460 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_08011460: .4byte 0x03002870
