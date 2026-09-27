	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805EBF0
sub_0805EBF0: @ 0x0805EBF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _0805EC20 @ =0x08BCCB70
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _0805EC24 @ =0x08276AB0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805EC28 @ =0x08276690
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EC20: .4byte 0x08BCCB70
_0805EC24: .4byte 0x08276AB0
_0805EC28: .4byte 0x08276690
