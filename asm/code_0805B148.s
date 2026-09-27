	.include "macro.inc"

	.syntax unified

	thumb_func_start efxDivineBG_Loop
efxDivineBG_Loop: @ 0x0805B148
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805B1C0
	ldr r5, [r7, #0x4c]
	ldr r6, [r7, #0x50]
	ldr r0, [r7, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	adds r4, r4, r6
	ldr r2, [r4]
	bl SpellFx_WriteBgMap
	ldr r0, _0805B1A0 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805B1DE
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805B1A8
	ldr r0, _0805B1A4 @ =0x02023460
	b _0805B1AC
	.align 2, 0
_0805B1A0: .4byte 0x0203E02C
_0805B1A4: .4byte 0x02023460
_0805B1A8:
	ldr r0, _0805B1BC @ =0x0202349A
	movs r1, #0
_0805B1AC:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805B1DE
	.align 2, 0
_0805B1BC: .4byte 0x0202349A
_0805B1C0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805B1DE
	bl SpellFx_ClearBG1
	ldr r1, _0805B1E8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_Break
_0805B1DE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B1E8: .4byte 0x0201774C
