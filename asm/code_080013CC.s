	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBgChrId
GetBgChrId: @ 0x080013CC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7, #4]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	str r0, [r7, #4]
	ldr r0, [r7]
	bl GetBgChrOffset
	ldr r2, [r7, #4]
	subs r1, r2, r0
	adds r0, r1, #0
	cmp r0, #0
	bge _080013F0
	adds r0, #0x1f
_080013F0:
	asrs r1, r0, #5
	adds r0, r1, #0
	b _080013F6
_080013F6:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0
