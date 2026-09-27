	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteGameSave
WriteGameSave: @ 0x080A0810
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	mov sb, r0
	bl GetSaveWriteAddr
	adds r7, r0, #0
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r4, _080A08E0 @ =0x0202BBF8
	mov r0, sb
	strb r0, [r4, #0xc]
	bl GetGameTime
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x48
	bl WriteAndVerifySramFast
	add r1, sp, #0x10
	mov r8, r1
	adds r4, r7, #0
	adds r4, #0x48
	movs r6, #0
	ldr r0, _080A08E4 @ =0x0202BD50
	mov sl, r0
	movs r5, #0x33
_080A0850:
	mov r1, sl
	adds r0, r6, r1
	adds r1, r4, #0
	bl WriteGameSavePackedUnit
	adds r4, #0x24
	adds r6, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A0850
	mov r0, r8
	bl ReadGlobalSaveInfo
	movs r4, #0
	ldr r6, _080A08E4 @ =0x0202BD50
	movs r5, #0x33
_080A0870:
	adds r0, r4, r6
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	mov r1, r8
	bl MetaSave_SetMetCharacter
	adds r4, #0x48
	subs r5, #1
	cmp r5, #0
	bge _080A0870
	movs r4, #0
	mov r0, r8
	bl WriteGlobalSaveInfo
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_0809E9C4
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl WritePidStats
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl WriteChapterStats
	adds r0, r7, #0
	bl WriteBonusContentClaimFlags
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809E954
	ldr r0, _080A08E8 @ =0x00011217
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sb
	bl WriteSaveBlockInfo
	mov r0, sb
	bl WriteLastGameSaveId
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A08E0: .4byte 0x0202BBF8
_080A08E4: .4byte 0x0202BD50
_080A08E8: .4byte 0x00011217
