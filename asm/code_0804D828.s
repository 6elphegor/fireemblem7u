	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxHpBar_WaitCameraMove
EfxHpBar_WaitCameraMove: @ 0x0804D828
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	subs r0, #4
	cmp r1, r0
	bne _0804D84E
	ldr r0, [r2, #0x64]
	bl GetAnimAnotherSide
	movs r0, #4
	bl EnableBgSync
	b _0804D864
_0804D84E:
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _0804D864
	ldr r1, _0804D868 @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r2, #0
	bl Proc_Break
_0804D864:
	pop {r0}
	bx r0
	.align 2, 0
_0804D868: .4byte 0x02017728
