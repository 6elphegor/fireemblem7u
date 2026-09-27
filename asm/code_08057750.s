	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057750
sub_08057750: @ 0x08057750
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08057776
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08057790
_08057776:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08057790
	bl SpellFx_ClearColorEffects
	ldr r1, _08057798 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057790:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057798: .4byte 0x0201774C
