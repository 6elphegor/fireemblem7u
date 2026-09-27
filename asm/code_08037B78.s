	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08037B78
sub_08037B78: @ 0x08037B78
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x64
	bl RandNext
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08037BB4 @ =0x030013B8
	ldr r1, [r1]
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _08037BC0
	ldr r0, _08037BB8 @ =0x0203A8EC
	adds r0, #0x7b
	movs r1, #2
	ldrb r2, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r4, _08037BBC @ =AiIsUnitEnemy
	adds r0, r4, #0
	bl AiTryDoStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037BC8
	adds r0, r4, #0
	bl AiAttemptOffensiveAction
	b _08037BC8
	.align 2, 0
_08037BB4: .4byte 0x030013B8
_08037BB8: .4byte 0x0203A8EC
_08037BBC: .4byte AiIsUnitEnemy
_08037BC0:
	ldr r0, _08037BD4 @ =0x0203A8EC
	adds r0, #0x79
	movs r1, #4
	strb r1, [r0]
_08037BC8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037BD4: .4byte 0x0203A8EC
