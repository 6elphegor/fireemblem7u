	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A6F8
sub_0805A6F8: @ 0x0805A6F8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805A730 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A734 @ =0x08BA28A0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805A738 @ =0x081E8802
	str r1, [r0, #0x48]
	ldr r1, _0805A73C @ =0x0827DC34
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A730: .4byte 0x0201774C
_0805A734: .4byte 0x08BA28A0
_0805A738: .4byte 0x081E8802
_0805A73C: .4byte 0x0827DC34
