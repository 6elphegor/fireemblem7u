	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadGameSave
ReadGameSave: @ 0x080A08EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	bl GetSaveReadAddr
	adds r7, r0, #0
	bl ClearMenuOverrides
	ldr r1, _080A0990 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080A0912
	movs r0, #3
	bl InvalidateSuspendSave
_080A0912:
	ldr r0, _080A0994 @ =0x03005E70
	ldr r4, _080A0998 @ =0x0202BBF8
	ldr r3, [r0]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	mov r0, sb
	strb r0, [r4, #0xc]
	bl InitUnits
	movs r6, #0
	adds r4, r7, #0
	adds r4, #0x48
	ldr r1, _080A099C @ =0x0202BD50
	mov r8, r1
	movs r5, #0x33
_080A093C:
	mov r0, r8
	adds r1, r6, r0
	adds r0, r4, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A093C
	movs r1, #0xf3
	lsls r1, r1, #3
	adds r0, r7, r1
	bl sub_0809E9DC
	movs r1, #0xd8
	lsls r1, r1, #4
	adds r0, r7, r1
	bl sub_0809E99C
	movs r1, #0x86
	lsls r1, r1, #4
	adds r0, r7, r1
	bl ReadPidStats
	movs r1, #0xcc
	lsls r1, r1, #4
	adds r0, r7, r1
	bl ReadChapterStats
	adds r0, r7, #0
	bl ReadBonusContentClaimFlags
	mov r0, sb
	bl WriteLastGameSaveId
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0990: .4byte 0x0202BBB8
_080A0994: .4byte 0x03005E70
_080A0998: .4byte 0x0202BBF8
_080A099C: .4byte 0x0202BD50
