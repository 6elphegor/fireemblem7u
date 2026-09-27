	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080764E0
sub_080764E0: @ 0x080764E0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08076504 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	ldr r2, _08076504 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	bl StartManimUnlockFx
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076504: .4byte 0x0203E0FC
