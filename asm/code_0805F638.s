	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F638
sub_0805F638: @ 0x0805F638
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F67C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F680 @ =0x08BA3798
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805F684 @ =0x081E9290
	str r1, [r0, #0x48]
	ldr r1, _0805F688 @ =0x08BA37B0
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805F68C @ =0x0829211C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805F690 @ =0x0829164C
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F67C: .4byte 0x0201774C
_0805F680: .4byte 0x08BA3798
_0805F684: .4byte 0x081E9290
_0805F688: .4byte 0x08BA37B0
_0805F68C: .4byte 0x0829211C
_0805F690: .4byte 0x0829164C
