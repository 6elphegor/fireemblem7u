	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D9A4
sub_0809D9A4: @ 0x0809D9A4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
	movs r1, #0
	cmp r2, r3
	bge _0809D9CA
_0809D9B2:
	adds r0, r4, r1
	ldrb r6, [r0]
	adds r5, r6, #0
	muls r5, r6, r5
	adds r0, r5, #0
	adds r1, #1
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, r3
	blt _0809D9B2
_0809D9CA:
	lsrs r0, r2, #8
	adds r0, r2, r0
	asrs r1, r2, #0x10
	adds r0, r0, r1
	ldr r2, _0809D9E0 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D9E0: .4byte 0x000003FF
