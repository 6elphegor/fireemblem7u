	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803A874
sub_0803A874: @ 0x0803A874
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4]
	cmp r0, r1
	bhi _0803A8B0
	bl AiTryDoSpecialItems
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A8B8
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r4, [r4, #1]
	cmp r0, r4
	bhi _0803A8B8
	ldr r0, _0803A8AC @ =AiIsUnitEnemy
	bl AiAttemptOffensiveAction
	b _0803A8B8
	.align 2, 0
_0803A8AC: .4byte AiIsUnitEnemy
_0803A8B0:
	ldr r0, _0803A8C0 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_0803A8B8:
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803A8C0: .4byte 0x0203A8EC
