	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B4D0
sub_0805B4D0: @ 0x0805B4D0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _0805B50A
	ldr r5, [r6, #0x4c]
	ldr r0, [r6, #0x54]
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, [r6, #0x5c]
	adds r4, r4, r5
	ldr r1, [r4]
	movs r2, #0x20
	movs r3, #0x14
	bl SpellFx_WriteBgMapExt
	b _0805B528
_0805B50A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0805B528
	bl SpellFx_ClearBG1
	ldr r1, _0805B530 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl SpellFx_ClearColorEffects
	adds r0, r6, #0
	bl Proc_Break
_0805B528:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B530: .4byte 0x0201774C
