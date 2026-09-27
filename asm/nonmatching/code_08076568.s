	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076568
sub_08076568: @ 0x08076568
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076594 @ =0x0203E0FC
	ldr r2, _08076594 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl sub_08073198
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076594: .4byte 0x0203E0FC
