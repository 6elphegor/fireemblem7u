	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08062D74
sub_08062D74: @ 0x08062D74
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
	blt _08062DA2
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08062DC0
_08062DA2:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08062DC0
	bl SpellFx_ClearBG1
	ldr r1, _08062DC8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_End
_08062DC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062DC8: .4byte 0x0201774C
