	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060940
sub_08060940: @ 0x08060940
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _080609B8
	ldr r1, [r4, #0x4c]
	ldr r3, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r1, [r1]
	adds r2, r2, r3
	ldr r2, [r2]
	bl SpellFx_WriteBgMap
	ldr r0, _08060994 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080609D6
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	adds r1, r0, #0
	cmp r1, #0
	bne _0806099C
	ldr r0, _08060998 @ =0x02023460
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
	b _080609AC
	.align 2, 0
_08060994: .4byte 0x0203E02C
_08060998: .4byte 0x02023460
_0806099C:
	ldr r0, _080609B4 @ =0x0202349A
	movs r1, #0
	str r1, [sp]
	movs r1, #3
	movs r2, #0x14
	movs r3, #0
	bl FillBGRect
_080609AC:
	movs r0, #2
	bl EnableBgSync
	b _080609D6
	.align 2, 0
_080609B4: .4byte 0x0202349A
_080609B8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _080609D6
	bl SpellFx_ClearBG1
	ldr r1, _080609E0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r4, #0
	bl Proc_Break
_080609D6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080609E0: .4byte 0x0201774C
