	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A828
sub_0803A828: @ 0x0803A828
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0803A85C @ =0x0203A8EC
	ldrb r2, [r4, #1]
	adds r1, r3, #0
	adds r1, #0x7c
	strb r2, [r1]
	ldrb r4, [r4]
	cmp r0, r4
	bhi _0803A864
	ldr r4, _0803A860 @ =AiIsUnitEnemy
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A86C
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _0803A86C
	.align 2, 0
_0803A85C: .4byte 0x0203A8EC
_0803A860: .4byte AiIsUnitEnemy
_0803A864:
	adds r1, r3, #0
	adds r1, #0x79
	movs r0, #4
	strb r0, [r1]
_0803A86C:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
