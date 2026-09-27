	.include "macro.inc"

	.syntax unified

	thumb_func_start StartTalkFaceMove
StartTalkFaceMove: @ 0x0800903C
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	bl GetTalkFaceHPos
	lsls r0, r0, #3
	bl GetFaceIdByXPos
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08009084
	ldr r0, _0800908C @ =0x08B90A0C
	ldr r1, _08009090 @ =0x030041C0
	lsls r4, r5, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl Proc_Start
	adds r3, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	adds r0, r3, #0
	adds r0, #0x68
	strh r1, [r0]
	lsls r0, r7, #0x18
	asrs r0, r0, #0x18
	adds r1, r3, #0
	adds r1, #0x6a
	strh r0, [r1]
_08009084:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800908C: .4byte 0x08B90A0C
_08009090: .4byte 0x030041C0
