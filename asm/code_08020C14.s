	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020C14
sub_08020C14: @ 0x08020C14
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _08020C54 @ =0x08B93C7C
	movs r1, #3
	bl Proc_Start
	lsls r0, r4, #4
	ldr r2, _08020C58 @ =0x0202BBB8
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
_08020C54: .4byte 0x08B93C7C
_08020C58: .4byte 0x0202BBB8
