	.include "macro.inc"

	.syntax unified

	thumb_func_start StartLightRuneAnim3
StartLightRuneAnim3: @ 0x0802061C
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08020660 @ =0x08B93B74
	adds r1, r3, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08020664 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x18
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x28
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020660: .4byte 0x08B93B74
_08020664: .4byte 0x0202BBB8
