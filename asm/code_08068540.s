	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08068540
sub_08068540: @ 0x08068540
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08068570 @ =0x08BDB3B8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08068574 @ =0x082E5B38
	str r1, [r0, #0x48]
	ldr r1, _08068578 @ =0x08BDB3D0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0806857C @ =0x08BDB42C
	str r1, [r0, #0x54]
	ldr r1, _08068580 @ =0x08BDB488
	str r1, [r0, #0x58]
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068570: .4byte 0x08BDB3B8
_08068574: .4byte 0x082E5B38
_08068578: .4byte 0x08BDB3D0
_0806857C: .4byte 0x08BDB42C
_08068580: .4byte 0x08BDB488
