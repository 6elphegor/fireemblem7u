	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearTalkBubble
ClearTalkBubble: @ 0x08009754
	push {lr}
	ldr r0, _0800978C @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #0xff
	strb r0, [r1, #0xf]
	ldr r0, _08009790 @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #2
	bl TalkBgSync
	bl ClearPutTalkText
	ldr r2, _08009794 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0800978C: .4byte 0x08B909B8
_08009790: .4byte 0x02023460
_08009794: .4byte 0x03002870
