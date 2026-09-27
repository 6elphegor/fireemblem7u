	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxThunderBGMain
EfxThunderBGMain: @ 0x080581A4
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _080581FC
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r5, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	cmp r5, #0
	bne _080581DA
	ldr r6, _080581F4 @ =0x0000011F
_080581DA:
	cmp r5, #1
	bne _080581E2
	movs r6, #0xa8
	lsls r6, r6, #1
_080581E2:
	ldr r0, _080581F8 @ =0x0202349C
	str r6, [sp]
	movs r1, #2
	movs r2, #0x14
	movs r3, #1
	bl FillBGRect
	b _0805821A
	.align 2, 0
_080581F4: .4byte 0x0000011F
_080581F8: .4byte 0x0202349C
_080581FC:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805821A
	bl SpellFx_ClearBG1
	ldr r1, _08058224 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_0805821A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058224: .4byte 0x0201774C
