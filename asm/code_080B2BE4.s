	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2BE4
sub_080B2BE4: @ 0x080B2BE4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Mark
	bl ClearTalk
	ldr r1, _080B2C54 @ =0x08CE7280
	adds r0, r1, #0
	bl Proc_EndEach
	ldr r0, _080B2C58 @ =0x0203A85C
	ldrb r1, [r0, #0x11]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x16
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #0x11]
	ldr r1, _080B2C5C @ =0x03004690
	ldr r0, [r1]
	ldr r2, _080B2C5C @ =0x03004690
	ldr r1, [r2]
	ldr r2, [r1, #0xc]
	movs r1, #0x40
	orrs r2, r1
	str r2, [r0, #0xc]
	ldr r0, _080B2C5C @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl PidStatsAddBattleAmt
	bl EndAllMus
	ldr r0, _080B2C58 @ =0x0203A85C
	ldrb r1, [r0, #0x15]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #0x15]
	ldr r0, _080B2C5C @ =0x03004690
	ldr r1, [r0]
	adds r0, r1, #0
	bl BattleGenerateArena
	bl BeginBattleAnimations
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2C54: .4byte 0x08CE7280
_080B2C58: .4byte 0x0203A85C
_080B2C5C: .4byte 0x03004690
