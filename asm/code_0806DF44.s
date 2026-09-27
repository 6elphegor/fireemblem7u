	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DF44
sub_0806DF44: @ 0x0806DF44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #1]
	adds r0, r1, #0
	adds r0, #0x10
	adds r1, r0, #0
	lsls r0, r1, #5
	asrs r1, r0, #1
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r0, _0806DF7C @ =0x02022860
	adds r1, r1, r0
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #0x14
	ldr r3, [r7]
	bl StartPalFade
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF7C: .4byte 0x02022860
