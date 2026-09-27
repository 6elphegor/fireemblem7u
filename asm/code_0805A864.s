	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A864
sub_0805A864: @ 0x0805A864
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805A8A4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A8A8 @ =0x08BA2900
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r5, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x44]
	str r2, [r0, #0x48]
	ldr r0, _0805A8AC @ =0x0828E1DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _0805A8B0 @ =0x0828EA64
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A8A4: .4byte 0x0201774C
_0805A8A8: .4byte 0x08BA2900
_0805A8AC: .4byte 0x0828E1DC
_0805A8B0: .4byte 0x0828EA64
