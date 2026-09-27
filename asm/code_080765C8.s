	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080765C8
sub_080765C8: @ 0x080765C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080765F8 @ =0x0203E0FC
	ldr r2, _080765F8 @ =0x0203E0FC
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
	movs r1, #0
	bl StartMuFadeIntoFlash
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080765F8: .4byte 0x0203E0FC
