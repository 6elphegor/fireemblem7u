	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805BEC0
sub_0805BEC0: @ 0x0805BEC0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805BF00 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805BF04 @ =0x08BA2C70
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0805BF08 @ =0x081E8B3A
	str r1, [r0, #0x48]
	ldr r1, _0805BF0C @ =0x08BA2C88
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805BF10 @ =0x08BA2CF4
	str r1, [r0, #0x54]
	str r2, [r0, #0x58]
	ldr r0, _0805BF14 @ =0x0824A734
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BF00: .4byte 0x0201774C
_0805BF04: .4byte 0x08BA2C70
_0805BF08: .4byte 0x081E8B3A
_0805BF0C: .4byte 0x08BA2C88
_0805BF10: .4byte 0x08BA2CF4
_0805BF14: .4byte 0x0824A734
