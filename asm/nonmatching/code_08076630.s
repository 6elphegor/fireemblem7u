	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08076630
sub_08076630: @ 0x08076630
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08076660 @ =0x0203E0FC
	ldr r2, _08076660 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl HideMu
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076660: .4byte 0x0203E0FC
