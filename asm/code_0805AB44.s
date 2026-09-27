	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805AB44
sub_0805AB44: @ 0x0805AB44
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805AB88 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805AB8C @ =0x08BA2960
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r4, #0
	strh r4, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	strh r5, [r0, #0x30]
	movs r1, #2
	str r1, [r0, #0x44]
	str r4, [r0, #0x48]
	ldr r0, _0805AB90 @ =0x0828EA84
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _0805AB94 @ =0x0828EAB8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805AB98 @ =0x0202003C
	str r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB88: .4byte 0x0201774C
_0805AB8C: .4byte 0x08BA2960
_0805AB90: .4byte 0x0828EA84
_0805AB94: .4byte 0x0828EAB8
_0805AB98: .4byte 0x0202003C
