	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805BDCC
sub_0805BDCC: @ 0x0805BDCC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BE20 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BE24 @ =0x08BA2C70
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805BE28 @ =0x081E8A92
	str r1, [r0, #0x48]
	ldr r1, _0805BE2C @ =0x08BA2C88
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805BE30 @ =0x08BA2CF4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805BE34 @ =0x08232BB0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	ldr r2, _0805BE38 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE20: .4byte 0x0201774C
_0805BE24: .4byte 0x08BA2C70
_0805BE28: .4byte 0x081E8A92
_0805BE2C: .4byte 0x08BA2C88
_0805BE30: .4byte 0x08BA2CF4
_0805BE34: .4byte 0x08232BB0
_0805BE38: .4byte 0x03002870
