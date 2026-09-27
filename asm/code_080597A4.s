	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080597A4
sub_080597A4: @ 0x080597A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x60]
	ldr r0, _080597D4 @ =0x08BB94FC
	str r0, [r1, #0x24]
	str r0, [r1, #0x20]
	movs r0, #0
	strh r0, [r1, #6]
	ldr r0, _080597D8 @ =0x0822A25C
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _080597DC @ =0x08229664
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080597D4: .4byte 0x08BB94FC
_080597D8: .4byte 0x0822A25C
_080597DC: .4byte 0x08229664
