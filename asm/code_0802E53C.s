	.include "macro.inc"

	.syntax unified

	thumb_func_start ResumeMapMainDuringAction
ResumeMapMainDuringAction: @ 0x0802E53C
	push {r4, r5, lr}
	adds r4, r0, #0
	bl RefreshEntityMaps
	bl RefreshUnitSprites
	ldr r2, _0802E5AC @ =0x03002870
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
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	ldr r4, _0802E5B0 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r5, _0802E5B4 @ =0x03004690
	str r0, [r5]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r2, _0802E5B8 @ =0x0202E3DC
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl HideUnitSprite
	ldr r0, [r5]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E5AC: .4byte 0x03002870
_0802E5B0: .4byte 0x0203A85C
_0802E5B4: .4byte 0x03004690
_0802E5B8: .4byte 0x0202E3DC
