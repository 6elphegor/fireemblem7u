	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806E188
sub_0806E188: @ 0x0806E188
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
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
	strh r2, [r0, #0x1a]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7]
	ldr r4, [r0, #0x30]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetMuAnimForJid
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetSpriteAnimInfo
	ldr r0, [r7]
	bl sub_0806D554
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	ldrb r2, [r1]
	adds r0, r2, #0
	bl sub_0806D524
	adds r1, r0, #0
	adds r0, r4, #0
	bl Decompress
	ldr r0, [r7, #8]
	ldr r1, [r7]
	ldr r2, [r1, #0x34]
	ldrb r1, [r2, #1]
	adds r2, r1, #0
	adds r2, #0x10
	adds r1, r2, #0
	lsls r2, r1, #5
	adds r1, r2, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
