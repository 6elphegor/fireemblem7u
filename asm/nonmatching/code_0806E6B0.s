	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_DisplayDeathQuote
Manim_DisplayDeathQuote: @ 0x0806E6B0
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E6D0 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E6E4
	cmp r0, #2
	beq _0806E6D4
	b _0806E6F8
	.align 2, 0
_0806E6D0: .4byte 0x0203E0FC
_0806E6D4:
	ldr r1, _0806E6F4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806E6E4
	movs r0, #1
	str r0, [r7, #4]
_0806E6E4:
	ldr r0, _0806E6F4 @ =0x0203E0FC
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806E6F0
	movs r0, #0
	str r0, [r7, #4]
_0806E6F0:
	b _0806E6F8
	.align 2, 0
_0806E6F4: .4byte 0x0203E0FC
_0806E6F8:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806E742
	ldr r0, _0806E74C @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r1]
	ldrb r1, [r0, #4]
	str r1, [r7, #8]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl CheckBattleDefeatTalk
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E742
	bl EndManimInfoWindow
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r1, #0
	bl DisplayDefeatTalkForPid
	bl sub_0800ADB8
_0806E742:
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E74C: .4byte 0x0203E0FC
