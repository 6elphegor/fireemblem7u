	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804AB58
sub_0804AB58: @ 0x0804AB58
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r6, r2, #0
	adds r0, #0x60
	ldrb r2, [r0]
	cmp r2, #9
	bls _0804AB96
	lsls r0, r2, #4
	subs r0, #0x90
	adds r1, #0x61
	ldrb r1, [r1]
	muls r0, r1, r0
	movs r1, #9
	bl __divsi3
	adds r5, r0, #0
	lsls r4, r5, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	bl SetBgOffset
	ldr r0, [r6]
	subs r0, r0, r5
	str r0, [r6]
_0804AB96:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
