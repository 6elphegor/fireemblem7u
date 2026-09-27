	.include "macro.inc"

	.syntax unified

	thumb_func_start FormatTime
FormatTime: @ 0x08000F80
	push {r4, r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r4, [r7, #0xc]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x3c
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x3c
	bl __umodsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r4, [r7, #8]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0xe1
	lsls r1, r1, #4
	bl __udivsi3
	adds r1, r0, #0
	adds r0, r1, #0
	movs r1, #0x3c
	bl __umodsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r4, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	ldr r1, _08000FF0 @ =0x00034BC0
	bl __udivsi3
	adds r1, r0, #0
	strh r1, [r4]
	ldr r1, [r7]
	adds r0, r1, #0
	movs r1, #0x1e
	bl __udivsi3
	adds r1, r0, #0
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r1, r0, #0
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	adds r0, r1, #0
	b _08000FF4
	.align 2, 0
_08000FF0: .4byte 0x00034BC0
_08000FF4:
	add sp, #0x10
	pop {r4, r7}
	pop {r1}
	bx r1
