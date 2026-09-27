	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxLvupBg2Main
EfxLvupBg2Main: @ 0x08069F1C
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
	blt _08069F4A
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	b _08069F58
_08069F4A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _08069F58
	adds r0, r4, #0
	bl Proc_Break
_08069F58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
