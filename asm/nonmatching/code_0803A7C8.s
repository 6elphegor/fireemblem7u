	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A7C8
sub_0803A7C8: @ 0x0803A7C8
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _0803A818 @ =0x0203A8EC
	adds r1, r0, #0
	adds r1, #0x86
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803A80E
	ldrb r0, [r1]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0803A81C @ =sub_0803A71C
	bl AiAttemptOffensiveAction
	ldr r5, _0803A820 @ =0x0203A97C
	ldrb r0, [r5, #0xa]
	cmp r0, #1
	beq _0803A80E
	ldr r0, _0803A824 @ =sub_0803A754
	bl AiAttemptOffensiveAction
	ldrb r5, [r5, #0xa]
	cmp r5, #1
	beq _0803A80E
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl AiTryMoveTowards
_0803A80E:
	movs r0, #1
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A818: .4byte 0x0203A8EC
_0803A81C: .4byte sub_0803A71C
_0803A820: .4byte 0x0203A97C
_0803A824: .4byte sub_0803A754
