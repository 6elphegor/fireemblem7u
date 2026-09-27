	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxCloudsOffsetGraphicsEffect
WfxCloudsOffsetGraphicsEffect: @ 0x0802DC1C
	push {r4, r5, r6, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0xd0
	lsls r0, r0, #1
	adds r2, r5, r0
	mov r1, sp
	movs r3, #7
_0802DC2C:
	ldm r2!, {r0}
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _0802DC2C
	movs r0, #0xd
	adds r6, r5, #0
	subs r6, #0x20
_0802DC3C:
	subs r4, r0, #1
	lsls r0, r0, #5
	adds r2, r0, r6
	movs r3, #7
_0802DC44:
	ldr r1, [r2, #0x20]
	lsls r1, r1, #4
	ldr r0, [r2]
	lsrs r0, r0, #0x1c
	orrs r1, r0
	str r1, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _0802DC44
	adds r0, r4, #0
	cmp r0, #0
	bge _0802DC3C
	movs r6, #0x10
	rsbs r6, r6, #0
	adds r2, r5, #0
	mov r4, sp
	movs r3, #7
_0802DC68:
	ldr r1, [r2]
	ands r1, r6
	str r1, [r2]
	ldm r4!, {r0}
	lsrs r0, r0, #0x1c
	orrs r1, r0
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bge _0802DC68
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r0}
	bx r0
