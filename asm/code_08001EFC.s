	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08001EFC
sub_08001EFC: @ 0x08001EFC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08001F14 @ =0x0000027F
	str r0, [r7, #8]
_08001F0A:
	ldr r0, [r7, #8]
	cmp r0, #0
	bge _08001F18
	b _08001F32
	.align 2, 0
_08001F14: .4byte 0x0000027F
_08001F18:
	ldr r0, [r7]
	adds r1, r7, #4
	ldr r2, [r1]
	ldrh r3, [r2]
	strh r3, [r0]
	adds r2, #2
	str r2, [r1]
	adds r0, #2
	str r0, [r7]
	ldr r0, [r7, #8]
	subs r1, r0, #1
	str r1, [r7, #8]
	b _08001F0A
_08001F32:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
