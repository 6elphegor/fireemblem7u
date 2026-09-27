	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF4A4
sub_080AF4A4: @ 0x080AF4A4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	movs r3, #0x30
	ldrsh r2, [r4, r3]
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r3, #0x18
	bl sub_080AEFA8
	strh r5, [r4, #0x2a]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
