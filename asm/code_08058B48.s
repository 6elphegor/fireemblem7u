	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058B48
sub_08058B48: @ 0x08058B48
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08058B84
	ldr r1, [r4, #0x4c]
	ldr r2, [r4, #0x50]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r3, #2
	adds r1, r4, r1
	ldr r1, [r1]
	adds r2, r4, r2
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	b _08058BA2
_08058B84:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _08058BA2
	bl SpellFx_ClearBG1
	ldr r1, _08058BA8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_08058BA2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058BA8: .4byte 0x0201774C
