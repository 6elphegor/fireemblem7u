	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080417BC
sub_080417BC: @ 0x080417BC
	push {r4, lr}
	lsls r1, r1, #0x12
	movs r2, #0xa0
	lsls r2, r2, #0x10
	adds r1, r1, r2
	lsrs r1, r1, #0x10
	movs r3, #0xc0
	lsls r3, r3, #7
	adds r2, r1, r3
	strh r2, [r0]
	ldr r4, _080417F0 @ =0x00006001
	adds r2, r1, r4
	strh r2, [r0, #2]
	adds r3, r0, #0
	adds r3, #0x40
	adds r4, #1
	adds r2, r1, r4
	strh r2, [r3]
	adds r0, #0x42
	ldr r2, _080417F4 @ =0x00006003
	adds r1, r1, r2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080417F0: .4byte 0x00006001
_080417F4: .4byte 0x00006003
