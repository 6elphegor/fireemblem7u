	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0320
sub_080B0320: @ 0x080B0320
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080B0340 @ =0x08CE6F3C
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x61
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	b _080B0344
	.align 2, 0
_080B0340: .4byte 0x08CE6F3C
_080B0344:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
