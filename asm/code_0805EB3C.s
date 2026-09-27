	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805EB3C
sub_0805EB3C: @ 0x0805EB3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EB6C @ =0x08BCC7E4
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EB70 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EB74 @ =0x082761F8
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB6C: .4byte 0x08BCC7E4
_0805EB70: .4byte 0x08276AB0
_0805EB74: .4byte 0x082761F8
