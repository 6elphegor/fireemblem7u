	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08032AC8
sub_08032AC8: @ 0x08032AC8
	push {r4, lr}
	ldr r1, _08032AF8 @ =0x0202BBB8
	ldr r0, _08032AFC @ =0x03004690
	ldr r0, [r0]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	lsls r4, r4, #4
	ldrh r1, [r1, #0xc]
	subs r4, r1, r4
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl GetGameTime
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	adds r1, r4, #0
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032AF8: .4byte 0x0202BBB8
_08032AFC: .4byte 0x03004690
