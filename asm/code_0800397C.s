	.include "macro.inc"

	.syntax unified

	thumb_func_start StartBgmFadeIn
StartBgmFadeIn: @ 0x0800397C
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r1, _0800399C @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	beq _080039A0
	b _08003A4E
	.align 2, 0
_0800399C: .4byte 0x0202BBF8
_080039A0:
	ldr r0, _08003A58 @ =0x02024E1C
	ldrb r1, [r0, #6]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #6]
	ldr r0, _08003A58 @ =0x02024E1C
	ldrb r1, [r0, #7]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #7]
	ldr r0, _08003A58 @ =0x02024E1C
	ldr r2, [r7]
	adds r1, r2, #0
	ldrh r2, [r0, #4]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #4]
	ldr r1, _08003A5C @ =0x08B85824
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0xc]
	ldr r1, _08003A60 @ =0x03005B10
	adds r0, r1, #0
	bl MPlayStop_rev01
	ldr r1, _08003A64 @ =0x03005D20
	adds r0, r1, #0
	bl MPlayStop_rev01
	ldr r1, [r7, #8]
	ldr r0, [r7]
	bl PlaySongCore
	ldr r1, _08003A60 @ =0x03005B10
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r1, _08003A64 @ =0x03005D20
	adds r0, r1, #0
	bl m4aMPlayImmInit
	ldr r0, _08003A60 @ =0x03005B10
	ldr r1, _08003A68 @ =0x0000FFFF
	movs r2, #0
	bl MPlayVolumeControl
	ldr r0, _08003A64 @ =0x03005D20
	ldr r1, _08003A68 @ =0x0000FFFF
	movs r2, #0
	bl MPlayVolumeControl
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #4
	adds r2, r0, #0
	adds r0, #0x4e
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _08003A6C @ =0x03000038
	ldr r1, [r7, #0xc]
	str r1, [r0]
_08003A4E:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A58: .4byte 0x02024E1C
_08003A5C: .4byte 0x08B85824
_08003A60: .4byte 0x03005B10
_08003A64: .4byte 0x03005D20
_08003A68: .4byte 0x0000FFFF
_08003A6C: .4byte 0x03000038
