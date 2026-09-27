	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082E08
sub_08082E08: @ 0x08082E08
	push {r4, r5, lr}
	adds r4, r0, #0
	bl SetHelpBoxDefaultRect
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl sub_080830C0
	adds r5, r4, #0
	adds r5, #0x4a
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #3
	bl __divsi3
	strh r0, [r5]
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
