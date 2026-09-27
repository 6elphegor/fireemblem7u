	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkSkipListener_OnIdle
TalkSkipListener_OnIdle: @ 0x08008130
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08008190 @ =0x08B90ACC
	bl Proc_Find
	cmp r0, #0
	bne _080081D2
	ldr r0, _08008194 @ =0x08B90B24
	bl Proc_Find
	cmp r0, #0
	bne _080081D2
	movs r0, #4
	bl CheckTalkFlag
	cmp r0, #0
	bne _080081A8
	ldr r0, _08008198 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080081A8
	bl sub_0800F08C
	ldr r0, _0800819C @ =0x08B909B8
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r4, #0
	bl Proc_End
	bl EndTalk
	ldr r0, _080081A0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _080081A4 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	b _080081D2
	.align 2, 0
_08008190: .4byte 0x08B90ACC
_08008194: .4byte 0x08B90B24
_08008198: .4byte 0x08B857F8
_0800819C: .4byte 0x08B909B8
_080081A0: .4byte 0x02022C60
_080081A4: .4byte 0x02023460
_080081A8:
	ldr r0, _080081D8 @ =0x08B90A4C
	bl Proc_Find
	cmp r0, #0
	bne _080081D2
	movs r0, #8
	bl CheckTalkFlag
	cmp r0, #0
	bne _080081D2
	ldr r0, _080081DC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xf3
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080081D2
	ldr r0, _080081E0 @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #0x12]
_080081D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080081D8: .4byte 0x08B90A4C
_080081DC: .4byte 0x08B857F8
_080081E0: .4byte 0x08B909B8
