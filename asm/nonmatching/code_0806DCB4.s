	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DCB4
sub_0806DCB4: @ 0x0806DCB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	movs r1, #4
	bl SetSpriteAnimId
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r0, _0806DD04 @ =sub_0806DD08
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	movs r2, #0x1e
	bl CallDelayedArg
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD04: .4byte sub_0806DD08
