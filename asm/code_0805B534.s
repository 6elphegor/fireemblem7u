	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B534
sub_0805B534: @ 0x0805B534
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B57C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B580 @ =0x08BA2BA8
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	ldr r0, _0805B584 @ =0x082779AC
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	ldr r0, _0805B588 @ =0x08279EC4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetBG1Position
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B57C: .4byte 0x0201774C
_0805B580: .4byte 0x08BA2BA8
_0805B584: .4byte 0x082779AC
_0805B588: .4byte 0x08279EC4
