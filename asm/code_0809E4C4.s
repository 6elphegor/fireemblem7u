	.include "macro.inc"

	.syntax unified

	thumb_func_start Checksum16
Checksum16: @ 0x0809E4C4
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	movs r4, #0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	cmp r3, r1
	bge _0809E4E4
_0809E4D6:
	ldrh r0, [r2]
	adds r3, r3, r0
	eors r4, r0
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _0809E4D6
_0809E4E4:
	adds r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
