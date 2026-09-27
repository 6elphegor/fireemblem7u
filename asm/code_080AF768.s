	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF768
sub_080AF768: @ 0x080AF768
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xd
	bhi _080AF788
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl sub_080AF5FC
	b _080AF79A
_080AF788:
	movs r0, #0xe
	movs r1, #0
	bl sub_080AF5FC
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl Proc_Break
_080AF79A:
	pop {r4}
	pop {r0}
	bx r0
