	.include "macro.inc"

	.syntax unified

	thumb_func_start StartDanceringAnim
StartDanceringAnim: @ 0x080207DC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08020838 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08020832
	ldr r0, _0802083C @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r0, _08020840 @ =0x08B93B94
	adds r1, r6, #0
	bl Proc_StartBlocking
	lsls r0, r4, #4
	ldr r2, _08020844 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r4, r0, #0
	subs r4, #0x10
	lsls r0, r5, #4
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r5, r0, #0
	subs r5, #0x10
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	rsbs r2, r5, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
_08020832:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020838: .4byte 0x0203A3D8
_0802083C: .4byte 0x0203A85C
_08020840: .4byte 0x08B93B94
_08020844: .4byte 0x0202BBB8
