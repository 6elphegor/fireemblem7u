	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806DC64
sub_0806DC64: @ 0x0806DC64
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	ldr r0, [r1, #0x30]
	ldr r2, [r7, #4]
	ldr r1, [r2, #0x34]
	ldr r2, [r7, #4]
	ldr r3, [r2, #0x34]
	ldrb r2, [r3, #1]
	movs r3, #0xf
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r3, [r7, #4]
	adds r2, r3, #0
	adds r3, #0x46
	ldrh r2, [r3]
	adds r1, r1, r2
	ldrh r2, [r0, #0x22]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0, #0x22]
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
