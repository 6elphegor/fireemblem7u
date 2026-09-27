	.include "macro.inc"

	.syntax unified

	thumb_func_start Tactician_Loop
Tactician_Loop: @ 0x0803F828
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	add r7, sp, #8
	adds r4, r0, #0
	mov r8, sp
	movs r0, #0x3c
	adds r0, r0, r4
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #4
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r1, sp
	subs r1, r1, r0
	mov sp, r1
	add r6, sp, #8
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl GetTacticianTextConf
	adds r5, r0, #0
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r5, #0
	bl Tactician_LoopCore
	ldrh r0, [r4, #0x36]
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	beq _0803F872
	movs r0, #3
	bl SioPlaySoundEffect
_0803F872:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	bl GetTacticianTextConf
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x3d
	adds r1, r6, #0
	bl SioStrCpy
	mov r1, sb
	ldrb r0, [r1]
	subs r0, #1
	adds r0, r6, r0
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	bl SioStrLen
	lsls r1, r0, #3
	subs r3, r1, r0
	ldr r6, [r4, #0x2c]
	ldrh r1, [r5, #0x30]
	subs r1, #4
	ldrh r2, [r5, #0x32]
	adds r2, #1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r4, [r0]
	cmp r4, #1
	bhi _0803F8BC
	ldrb r0, [r0]
	b _0803F8BE
_0803F8BC:
	movs r0, #2
_0803F8BE:
	str r0, [sp, #4]
	adds r0, r6, #0
	bl UpdateNameEntrySpriteDraw
	mov sp, r8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
