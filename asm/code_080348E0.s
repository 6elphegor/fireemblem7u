	.include "macro.inc"

	.syntax unified

	thumb_func_start AiPhase_Begin
AiPhase_Begin: @ 0x080348E0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803493C @ =0x0203A8EC
	adds r3, r2, #0
	adds r3, #0x7b
	movs r1, #0
	movs r0, #1
	strb r0, [r3]
	adds r3, #3
	movs r0, #0xff
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x78
	strb r1, [r0]
	ldr r5, _08034940 @ =0x081D3A60
	ldr r4, _08034944 @ =0x0202BBF8
	movs r3, #0
	movs r1, #7
	adds r0, #0x15
_08034906:
	strb r3, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _08034906
	adds r1, r2, #0
	adds r1, #0x80
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	bl AiUpdateUnitsSeekHealing
	bl SetupUnitInventoryAIFlags
	ldr r0, _08034948 @ =0x08B96ED4
	adds r1, r6, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803493C: .4byte 0x0203A8EC
_08034940: .4byte 0x081D3A60
_08034944: .4byte 0x0202BBF8
_08034948: .4byte 0x08B96ED4
