	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF7A0
sub_080AF7A0: @ 0x080AF7A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	adds r1, r0, #0
	strh r0, [r4, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _080AF7BE
	movs r5, #0
	adds r0, r4, #0
	bl Proc_Break
	b _080AF7C6
_080AF7BE:
	movs r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080AF7C6:
	movs r0, #0xe
	movs r1, #0
	bl sub_080AF5FC
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	adds r0, #1
	ldrb r2, [r0]
	adds r0, r5, #0
	bl sub_080AF69C
	pop {r4, r5}
	pop {r0}
	bx r0
