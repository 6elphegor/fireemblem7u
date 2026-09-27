	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B6F4
sub_0805B6F4: @ 0x0805B6F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B734 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B738 @ =0x08BA2BE0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r2, [r0, #0x30]
	movs r1, #0xa
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _0805B73C @ =0x0827ABF0
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805B740 @ =0x0827A6FC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B734: .4byte 0x0201774C
_0805B738: .4byte 0x08BA2BE0
_0805B73C: .4byte 0x0827ABF0
_0805B740: .4byte 0x0827A6FC
