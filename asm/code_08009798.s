	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearPutTalkText
ClearPutTalkText: @ 0x08009798
	push {r4, r5, r6, lr}
	ldr r0, _080097F0 @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl TalkBgSync
	ldr r2, _080097F4 @ =0x08B909B8
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _080097EA
	adds r6, r2, #0
_080097CA:
	lsls r4, r5, #3
	ldr r0, _080097F8 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl ClearText
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl Text_SetColor
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _080097CA
_080097EA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080097F0: .4byte 0x02022C60
_080097F4: .4byte 0x08B909B8
_080097F8: .4byte 0x030000C8
