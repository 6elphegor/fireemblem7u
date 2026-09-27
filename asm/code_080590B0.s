	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080590B0
sub_080590B0: @ 0x080590B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080590EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080590F0 @ =0x08BA1D3C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080590F4 @ =0x081E8414
	str r1, [r0, #0x48]
	ldr r1, _080590F8 @ =0x08BA1D80
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _080590FC @ =0x08BA1D54
	str r1, [r0, #0x54]
	ldr r0, _08059100 @ =0x0820D584
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080590EC: .4byte 0x0201774C
_080590F0: .4byte 0x08BA1D3C
_080590F4: .4byte 0x081E8414
_080590F8: .4byte 0x08BA1D80
_080590FC: .4byte 0x08BA1D54
_08059100: .4byte 0x0820D584
