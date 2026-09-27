	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DC14
sub_0806DC14: @ 0x0806DC14
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #1]
	adds r1, r0, #0
	adds r1, #0x10
	adds r0, r1, #0
	lsls r1, r0, #5
	asrs r0, r1, #1
	adds r1, r0, #0
	lsls r0, r1, #1
	ldr r2, _0806DC5C @ =0x02022860
	adds r1, r0, r2
	adds r0, r1, #0
	movs r1, #0x15
	movs r2, #8
	ldr r3, [r7]
	bl StartPalFade
	ldr r1, _0806DC60 @ =0x08C9D0BC
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x54]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC5C: .4byte 0x02022860
_0806DC60: .4byte 0x08C9D0BC
