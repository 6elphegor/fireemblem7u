	.include "macro.inc"

	.syntax unified

	thumb_func_start AiPhaseBerserkInit
AiPhaseBerserkInit: @ 0x0803494C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0803499C @ =0x0203A8EC
	adds r2, r0, #0
	adds r2, #0x7b
	movs r1, #4
	strb r1, [r2]
	adds r2, #3
	movs r1, #0xff
	strb r1, [r2]
	adds r1, r0, #0
	ldr r5, _080349A0 @ =0x081D3A60
	ldr r4, _080349A4 @ =0x0202BBF8
	movs r0, #0
	movs r3, #7
	adds r2, r1, #0
	adds r2, #0x8d
_0803496E:
	strb r0, [r2]
	subs r2, #1
	subs r3, #1
	cmp r3, #0
	bge _0803496E
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	bl AiUpdateUnitsSeekHealing
	bl SetupUnitInventoryAIFlags
	ldr r0, _080349A8 @ =0x08B96EEC
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803499C: .4byte 0x0203A8EC
_080349A0: .4byte 0x081D3A60
_080349A4: .4byte 0x0202BBF8
_080349A8: .4byte 0x08B96EEC
