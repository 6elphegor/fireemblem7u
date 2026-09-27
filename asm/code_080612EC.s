	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080612EC
sub_080612EC: @ 0x080612EC
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
	blt _08061312
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	b _08061328
_08061312:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08061328
	ldr r1, _08061330 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08061328:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061330: .4byte 0x0201774C
