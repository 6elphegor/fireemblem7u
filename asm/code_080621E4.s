	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080621E4
sub_080621E4: @ 0x080621E4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08062230 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08062234 @ =0x08BA417C
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08062238 @ =0x08BD7078
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r5, #0x60]
	ldrh r1, [r4, #2]
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	strh r1, [r0, #4]
	ldr r0, _0806223C @ =0x082D9C94
	movs r1, #0x80
	lsls r1, r1, #5
	bl SpellFx_RegisterObjGfx
	ldr r0, _08062240 @ =0x082DA240
	movs r1, #0x20
	bl SpellFx_RegisterObjPal
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08062230: .4byte 0x0201774C
_08062234: .4byte 0x08BA417C
_08062238: .4byte 0x08BD7078
_0806223C: .4byte 0x082D9C94
_08062240: .4byte 0x082DA240
