	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807E3B0
sub_0807E3B0: @ 0x0807E3B0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl GetUnitFromCharId
	adds r2, r0, #0
	ldr r1, [r2, #0xc]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	bne _0807E3D0
	adds r0, r4, #0
	movs r1, #0
	bl sub_08011DAC
	b _0807E3D6
_0807E3D0:
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_0807E3D6:
	pop {r4}
	pop {r0}
	bx r0
