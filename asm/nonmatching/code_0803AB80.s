	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAiSafestAccessibleAdjacentPosition
GetAiSafestAccessibleAdjacentPosition: @ 0x0803AB80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	mov r8, r2
	movs r0, #0
	mov sl, r0
	ldr r2, _0803AC24 @ =0x08B98AC8
	movs r1, #3
	mov sb, r1
_0803AB9C:
	ldr r0, [r2]
	ldr r1, [sp]
	adds r5, r1, r0
	ldr r0, [r2, #4]
	ldr r1, [sp, #4]
	adds r7, r1, r0
	ldr r0, _0803AC28 @ =0x0202E3E4
	ldr r0, [r0]
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0803AC0A
	ldr r0, _0803AC2C @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803ABD2
	ldr r0, _0803AC30 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803AC0A
_0803ABD2:
	adds r0, r5, #0
	adds r1, r7, #0
	str r2, [sp, #8]
	bl AiGetTerrainCombatPositionScoreComponent
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl AiGetFriendZoneCombatPositionScoreComponent
	adds r4, r4, r0
	ldr r0, _0803AC34 @ =0x0202E3F4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsrs r0, r0, #3
	subs r4, r4, r0
	ldr r0, _0803AC38 @ =0x7FFFFFFF
	adds r4, r4, r0
	ldr r2, [sp, #8]
	cmp sl, r4
	bhs _0803AC0A
	mov r1, r8
	strh r5, [r1]
	strh r7, [r1, #2]
	mov sl, r4
_0803AC0A:
	adds r2, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	cmp r1, #0
	bge _0803AB9C
	mov r0, sl
	cmp r0, #0
	bne _0803AC3C
	movs r0, #0
	b _0803AC3E
	.align 2, 0
_0803AC24: .4byte 0x08B98AC8
_0803AC28: .4byte 0x0202E3E4
_0803AC2C: .4byte 0x0202E3DC
_0803AC30: .4byte 0x0202BD48
_0803AC34: .4byte 0x0202E3F4
_0803AC38: .4byte 0x7FFFFFFF
_0803AC3C:
	movs r0, #1
_0803AC3E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
