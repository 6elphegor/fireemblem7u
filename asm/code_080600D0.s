	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080600D0
sub_080600D0: @ 0x080600D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060104 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060108 @ =0x08BA39F4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0806010C @ =0x081E9306
	str r1, [r0, #0x48]
	ldr r1, _08060110 @ =0x08296C04
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060104: .4byte 0x0201774C
_08060108: .4byte 0x08BA39F4
_0806010C: .4byte 0x081E9306
_08060110: .4byte 0x08296C04
