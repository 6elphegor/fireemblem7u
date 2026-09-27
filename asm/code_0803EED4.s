	.include "macro.inc"

	.syntax unified

	thumb_func_start SioTeamList_8044324
SioTeamList_8044324: @ 0x0803EED4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x2c]
	ldr r1, _0803EF3C @ =0x081D5263
	ldr r0, [r4, #0x44]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	movs r7, #1
	rsbs r7, r7, #0
	cmp r5, r7
	bne _0803EEF4
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_0803EEF4:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0803EF44
	ldr r3, _0803EF40 @ =0x03002870
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
	adds r1, r6, #0
	adds r1, #0x44
	movs r0, #1
	strb r0, [r1]
	str r7, [r6, #0x48]
	b _0803EF58
	.align 2, 0
_0803EF3C: .4byte 0x081D5263
_0803EF40: .4byte 0x03002870
_0803EF44:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #0
	bl SetBgOffset
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0803EE34
_0803EF58:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
