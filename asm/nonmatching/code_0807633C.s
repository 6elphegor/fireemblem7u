	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807633C
sub_0807633C: @ 0x0807633C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0807636C @ =0x0203E0FC
	ldr r2, _0807636C @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _08076370 @ =0x083F66A0
	ldr r2, _08076374 @ =0x083F695C
	movs r3, #0x8b
	bl StartManimEffectAnimator
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807636C: .4byte 0x0203E0FC
_08076370: .4byte 0x083F66A0
_08076374: .4byte 0x083F695C
