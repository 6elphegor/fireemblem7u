	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801EF64
sub_0801EF64: @ 0x0801EF64
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl GetMapChange
	ldrb r1, [r0, #3]
	lsrs r4, r1, #1
	ldrb r1, [r0, #1]
	adds r4, r1, r4
	ldrb r1, [r0, #4]
	lsrs r2, r1, #1
	ldrb r0, [r0, #2]
	adds r2, r0, r2
	adds r0, r5, #0
	adds r1, r4, #0
	bl EnsureCameraOntoPosition
	str r4, [r5, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
