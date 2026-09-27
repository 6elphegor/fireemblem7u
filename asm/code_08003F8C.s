	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08003F8C
sub_08003F8C: @ 0x08003F8C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08003FBC @ =0x02024E1C
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0, #8]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #8]
	ldr r0, [r7]
	lsls r1, r0, #8
	adds r0, r1, #0
	bl SoundMode_rev01
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003FBC: .4byte 0x02024E1C
