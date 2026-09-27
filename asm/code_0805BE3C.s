	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805BE3C
sub_0805BE3C: @ 0x0805BE3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BEA4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BEA8 @ =0x08BA2C70
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r4, #0
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805BEAC @ =0x081E8A98
	str r1, [r0, #0x48]
	ldr r1, _0805BEB0 @ =0x08BA2C88
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805BEB4 @ =0x08BA2CF4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805BEB8 @ =0x0824A714
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r3, _0805BEBC @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #1
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEA4: .4byte 0x0201774C
_0805BEA8: .4byte 0x08BA2C70
_0805BEAC: .4byte 0x081E8A98
_0805BEB0: .4byte 0x08BA2C88
_0805BEB4: .4byte 0x08BA2CF4
_0805BEB8: .4byte 0x0824A714
_0805BEBC: .4byte 0x03002870
