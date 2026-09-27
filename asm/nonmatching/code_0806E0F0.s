	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806E0F0
sub_0806E0F0: @ 0x0806E0F0
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	ldr r0, [r1, #0x30]
	ldr r1, [r7]
	ldr r2, [r1, #0x2c]
	ldr r1, [r2, #0x34]
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #1]
	movs r4, #0xf
	adds r2, r3, #0
	ands r2, r4
	adds r4, r2, #0
	lsls r3, r4, #0x18
	lsrs r2, r3, #0x18
	adds r3, r2, #0
	lsls r2, r3, #0xc
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	ldr r2, [r7]
	ldr r3, [r2, #0x2c]
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
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
