	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF80C
sub_080AF80C: @ 0x080AF80C
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x11
	cmp r0, #0x10
	bls _080AF826
	adds r0, r2, #0
	bl Proc_Break
	b _080AF840
_080AF826:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, #0x2e
	ldrb r2, [r2]
	bl sub_080AF69C
	movs r0, #0xe
	movs r1, #1
	bl sub_080AF5FC
_080AF840:
	pop {r0}
	bx r0
