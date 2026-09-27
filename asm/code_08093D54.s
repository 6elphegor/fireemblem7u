	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093D54
sub_08093D54: @ 0x08093D54
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x34]
	adds r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	adds r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x20
	bne _08093D72
	adds r0, r4, #0
	bl Proc_Break
_08093D72:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093D94
	lsrs r0, r1, #4
	subs r0, #1
	bl PrepUpdateMenuTsaScroll
_08093D94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
