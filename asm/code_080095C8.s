	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080095C8
sub_080095C8: @ 0x080095C8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xf
	ble _080096A8
	ldr r4, _080096B0 @ =0x08B909B8
	ldr r1, [r4]
	ldrb r0, [r1, #9]
	subs r0, #1
	strb r0, [r1, #9]
	ldr r1, [r4]
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r5, #0
	ldr r0, [r4]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	bge _08009646
	adds r6, r4, #0
_08009612:
	ldr r4, [r6]
	ldrb r2, [r4, #0xb]
	adds r0, r2, r5
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _080096B4 @ =0x030000C8
	adds r0, r0, r1
	lsls r1, r5, #1
	ldrb r2, [r4, #0xd]
	adds r1, r2, r1
	lsls r1, r1, #5
	ldrb r4, [r4, #0xc]
	adds r1, r4, r1
	lsls r1, r1, #1
	ldr r2, _080096B8 @ =0x02022C60
	adds r1, r1, r2
	bl PutText
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	subs r0, #1
	cmp r5, r0
	blt _08009612
_08009646:
	ldr r4, _080096B0 @ =0x08B909B8
	ldr r2, [r4]
	ldrb r0, [r2, #0xa]
	subs r0, #1
	lsls r0, r0, #1
	ldrb r1, [r2, #0xd]
	adds r0, r1, r0
	lsls r0, r0, #5
	ldrb r1, [r2, #0xc]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, _080096B8 @ =0x02022C60
	adds r0, r0, r1
	ldrb r1, [r2, #0xe]
	subs r1, #2
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, [r4]
	ldrb r1, [r0, #0xa]
	ldrb r0, [r0, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	ldr r5, _080096B4 @ =0x030000C8
	adds r0, r0, r5
	bl ClearText
	ldr r4, [r4]
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xb]
	subs r0, #1
	adds r0, r1, r0
	bl __modsi3
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4, #8]
	bl Text_SetColor
	movs r0, #1
	bl TalkBgSync
	adds r0, r7, #0
	bl Proc_Break
_080096A8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080096B0: .4byte 0x08B909B8
_080096B4: .4byte 0x030000C8
_080096B8: .4byte 0x02022C60
