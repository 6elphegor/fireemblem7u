	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08058854
sub_08058854: @ 0x08058854
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl EfxAdvanceFrameLut
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0805887A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08058890
_0805887A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08058890
	ldr r1, _08058898 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058890:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058898: .4byte 0x0201774C
