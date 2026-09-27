	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E634
sub_0805E634: @ 0x0805E634
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E678 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E67C @ =0x08BA34FC
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _0805E680 @ =0x08BC6FF4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	ldr r0, _0805E684 @ =0x082761B8
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	ldr r0, _0805E688 @ =0x08275FB0
	movs r1, #0x80
	lsls r1, r1, #4
	bl SpellFx_RegisterObjGfx
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E678: .4byte 0x0201774C
_0805E67C: .4byte 0x08BA34FC
_0805E680: .4byte 0x08BC6FF4
_0805E684: .4byte 0x082761B8
_0805E688: .4byte 0x08275FB0
