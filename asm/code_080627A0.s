	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080627A0
sub_080627A0: @ 0x080627A0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080627CE
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _080627EC
_080627CE:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080627EC
	bl SpellFx_ClearBG1
	ldr r1, _080627F4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080627EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080627F4: .4byte 0x0201774C
