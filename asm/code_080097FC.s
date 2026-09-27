	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearTalkText
ClearTalkText: @ 0x080097FC
	push {r4, r5, r6, lr}
	ldr r2, _08009848 @ =0x08B909B8
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
	bge _08009840
	adds r6, r2, #0
_08009820:
	lsls r4, r5, #3
	ldr r0, _0800984C @ =0x030000C8
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
	blt _08009820
_08009840:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009848: .4byte 0x08B909B8
_0800984C: .4byte 0x030000C8
