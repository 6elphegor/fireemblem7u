	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806CC90
sub_0806CC90: @ 0x0806CC90
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	adds r0, r1, #0
	bl EndSpriteAnim
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
