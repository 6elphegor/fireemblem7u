	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805EC68
sub_0805EC68: @ 0x0805EC68
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EC98 @ =0x08BCCB88
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EC9C @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805ECA0 @ =0x08276690
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EC98: .4byte 0x08BCCB88
_0805EC9C: .4byte 0x08276AB0
_0805ECA0: .4byte 0x08276690
