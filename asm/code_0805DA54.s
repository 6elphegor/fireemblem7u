	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805DA54
sub_0805DA54: @ 0x0805DA54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x5c]
	adds r0, r6, #0
	bl GetAnimAnotherSide
	adds r7, r0, #0
	ldr r4, _0805DAB0 @ =0x02000010
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r4, [r0]
	cmp r4, #0
	beq _0805DA84
	ldr r0, _0805DAB4 @ =0x0000F3FF
	ldrh r1, [r4, #8]
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_0805DA84:
	adds r0, r5, #0
	adds r0, #0x2c
	adds r1, r5, #0
	adds r1, #0x44
	ldr r2, [r5, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _0805DAB8
	ldr r1, [r5, #0x4c]
	ldr r2, [r5, #0x50]
	lsls r0, r3, #2
	adds r1, r0, r1
	ldr r1, [r1]
	adds r0, r0, r2
	ldr r2, [r0]
	adds r0, r7, #0
	bl SpellFx_WriteBgMap
	b _0805DB22
	.align 2, 0
_0805DAB0: .4byte 0x02000010
_0805DAB4: .4byte 0x0000F3FF
_0805DAB8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0805DB22
	bl SpellFx_ClearBG1
	ldr r1, _0805DB28 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r3, _0805DB2C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	strb r0, [r3, #0xc]
	adds r0, r1, #0
	ldrb r2, [r3, #0x10]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	movs r0, #3
	ldrb r1, [r3, #0x18]
	orrs r0, r1
	strb r0, [r3, #0x18]
	ldr r2, _0805DB30 @ =0x0000F3FF
	adds r0, r2, #0
	ldrh r3, [r6, #8]
	ands r0, r3
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r6, #8]
	cmp r4, #0
	beq _0805DB18
	adds r0, r2, #0
	ldrh r2, [r4, #8]
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #8]
_0805DB18:
	bl SpellFx_ClearColorEffects
	adds r0, r5, #0
	bl Proc_Break
_0805DB22:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DB28: .4byte 0x0201774C
_0805DB2C: .4byte 0x03002870
_0805DB30: .4byte 0x0000F3FF
