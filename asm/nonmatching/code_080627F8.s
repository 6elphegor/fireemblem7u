	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxYushaSpinShield
NewEfxYushaSpinShield: @ 0x080627F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0806281C @ =0x08BA42AC
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r0, r4, #0
	adds r1, r5, #0
	bl NewEfxYushaSpinShieldOBJ
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806281C: .4byte 0x08BA42AC
