	.include "macro.inc"

	.syntax unified

	thumb_func_start Event_MainLoop
Event_MainLoop: @ 0x0800B390
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, _0800B3D8 @ =0x08B969E4
	bl Proc_Find
	cmp r0, #0
	bne _0800B494
	bl IsSubtitleHelpActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B494
	bl IsMapFadeActive
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800B494
	adds r0, r4, #0
	bl Event_IsSkipAllowed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800B3E0
	ldr r0, _0800B3DC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0800B3E0
	adds r0, r4, #0
	bl Event_BeginSkip
	b _0800B494
	.align 2, 0
_0800B3D8: .4byte 0x08B969E4
_0800B3DC: .4byte 0x08B857F8
_0800B3E0:
	adds r3, r4, #0
	adds r3, #0x50
	ldrh r2, [r3]
	cmp r2, #0
	beq _0800B43C
	subs r5, r2, #1
	strh r5, [r3]
	adds r0, r4, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800B494
	ldr r0, _0800B434 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsrs r0, r0, #7
	cmp r0, #0
	bne _0800B412
	ldr r0, _0800B438 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #1
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0800B494
_0800B412:
	lsls r0, r5, #0x10
	cmp r0, #0
	beq _0800B494
	subs r0, r2, #2
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B494
	subs r0, r2, #3
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800B494
	subs r0, r2, #4
	strh r0, [r3]
	b _0800B494
	.align 2, 0
_0800B434: .4byte 0x0202BBF8
_0800B438: .4byte 0x08B857F8
_0800B43C:
	ldr r1, [r4, #0x40]
	cmp r1, #0
	beq _0800B44A
	adds r0, r4, #0
	bl _call_via_r1
	b _0800B494
_0800B44A:
	adds r6, r4, #0
	adds r6, #0x56
	ldr r7, _0800B468 @ =0x08B90E48
	adds r0, r7, #4
	mov r8, r0
_0800B454:
	ldr r0, [r4, #0x30]
	ldrh r5, [r0]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0800B46C
	subs r0, #1
	strh r0, [r6]
	movs r2, #0
	b _0800B47A
	.align 2, 0
_0800B468: .4byte 0x08B90E48
_0800B46C:
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r4, #0
	bl _call_via_r1
	adds r2, r0, #0
_0800B47A:
	cmp r2, #1
	beq _0800B454
	cmp r2, #3
	beq _0800B494
	lsls r0, r5, #3
	add r0, r8
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
	cmp r2, #2
	bne _0800B454
_0800B494:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
