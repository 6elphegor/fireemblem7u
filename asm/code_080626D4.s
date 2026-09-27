	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080626D4
sub_080626D4: @ 0x080626D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r1, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080626F8
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl NewEfxFlashBgWhite
	b _0806270E
_080626F8:
	cmp r0, #4
	bne _08062704
	adds r0, r1, #0
	bl sub_08062714
	b _0806270E
_08062704:
	cmp r0, #0x18
	bne _0806270E
	adds r0, r4, #0
	bl Proc_Break
_0806270E:
	pop {r4}
	pop {r0}
	bx r0
