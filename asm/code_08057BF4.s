	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057BF4
sub_08057BF4: @ 0x08057BF4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	blt _08057C34
	ldr r0, [r4, #0x4c]
	ldr r4, _08057C30 @ =0x020165C8
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	adds r3, r5, #0
	bl EfxPalWhiteInOut
	adds r0, r4, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08057C4A
	.align 2, 0
_08057C30: .4byte 0x020165C8
_08057C34:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08057C4A
	ldr r1, _08057C50 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057C4A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057C50: .4byte 0x0201774C
