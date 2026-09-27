	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080597E0
sub_080597E0: @ 0x080597E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _08059810 @ =0x08BB9680
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _08059814 @ =0x0822A25C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _08059818 @ =0x08229A64
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059810: .4byte 0x08BB9680
_08059814: .4byte 0x0822A25C
_08059818: .4byte 0x08229A64
