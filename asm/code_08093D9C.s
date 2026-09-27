	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093D9C
sub_08093D9C: @ 0x08093D9C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08093DB4
	lsrs r1, r1, #4
	subs r1, #1
	adds r0, r4, #0
	bl PrepUnit_DrawUnitListNames
_08093DB4:
	ldrh r0, [r4, #0x34]
	subs r0, #4
	strh r0, [r4, #0x34]
	ldrh r1, [r4, #0x30]
	subs r1, #4
	strh r1, [r4, #0x30]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08093DCC
	adds r0, r4, #0
	bl Proc_Break
_08093DCC:
	ldrh r2, [r4, #0x30]
	subs r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
