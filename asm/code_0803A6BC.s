	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A6BC
sub_0803A6BC: @ 0x0803A6BC
	push {lr}
	ldr r2, _0803A6DC @ =0x0203A988
	ldrb r1, [r0]
	strb r1, [r2]
	ldrb r0, [r0]
	bl AiUnitWithCharIdExists
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803A6E4
	ldr r0, _0803A6E0 @ =0x0203A8EC
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
	b _0803A70A
	.align 2, 0
_0803A6DC: .4byte 0x0203A988
_0803A6E0: .4byte 0x0203A8EC
_0803A6E4:
	ldr r0, _0803A710 @ =sub_0803A680
	bl AiAttemptOffensiveAction
	ldr r0, _0803A714 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x86
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0803A718 @ =0x0203A97C
	ldrb r2, [r0, #0xa]
	cmp r2, #1
	bne _0803A706
	ldrb r2, [r0]
	cmp r2, #1
	bne _0803A706
	ldrb r0, [r0, #6]
	strb r0, [r1]
_0803A706:
	bl AiClearDecision
_0803A70A:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0803A710: .4byte sub_0803A680
_0803A714: .4byte 0x0203A8EC
_0803A718: .4byte 0x0203A97C
