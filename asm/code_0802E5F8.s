	.include "macro.inc"

	.syntax unified

	thumb_func_start ResumeMapMainDuringArena
ResumeMapMainDuringArena: @ 0x0802E5F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _0802E664 @ =0x0203A85C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldr r4, _0802E668 @ =0x03004690
	str r0, [r4]
	bl ArenaResume
	ldr r0, [r4]
	bl BattleGenerateArena
	bl BeginBattleAnimations
	ldr r2, _0802E66C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl RefreshEntityMaps
	ldr r0, _0802E670 @ =0x0202E3DC
	ldr r1, [r0]
	ldrb r2, [r5, #0xf]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r5, [r5, #0xe]
	adds r0, r5, r0
	movs r1, #0
	strb r1, [r0]
	bl RefreshUnitSprites
	adds r0, r6, #0
	movs r1, #8
	bl Proc_Goto
	bl sub_080B26A4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E664: .4byte 0x0203A85C
_0802E668: .4byte 0x03004690
_0802E66C: .4byte 0x03002870
_0802E670: .4byte 0x0202E3DC
