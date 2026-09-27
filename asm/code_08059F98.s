	.include "macro.inc"

	.syntax unified

	thumb_func_start efxLightningBG_Loop
efxLightningBG_Loop: @ 0x08059F98
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _0805A020
	ldr r6, [r7, #0x4c]
	ldr r0, [r7, #0x50]
	mov r8, r0
	ldr r0, [r7, #0x54]
	ldr r4, [r7, #0x58]
	lsls r5, r5, #2
	adds r0, r5, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	adds r4, r5, r4
	ldr r0, [r4]
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, [r7, #0x5c]
	adds r6, r5, r6
	ldr r1, [r6]
	add r5, r8
	ldr r2, [r5]
	bl SpellFx_WriteBgMap
	ldr r0, _0805A000 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805A03E
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0805A008
	ldr r0, _0805A004 @ =0x02023460
	b _0805A00C
	.align 2, 0
_0805A000: .4byte 0x0203E02C
_0805A004: .4byte 0x02023460
_0805A008:
	ldr r0, _0805A01C @ =0x0202349A
	movs r1, #0
_0805A00C:
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _0805A03E
	.align 2, 0
_0805A01C: .4byte 0x0202349A
_0805A020:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0805A03E
	bl SpellFx_ClearBG1
	ldr r1, _0805A04C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r7, #0
	bl Proc_End
_0805A03E:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A04C: .4byte 0x0201774C
