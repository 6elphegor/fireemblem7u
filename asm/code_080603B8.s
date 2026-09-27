	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080603B8
sub_080603B8: @ 0x080603B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080603EC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080603F0 @ =0x08BA3B6C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080603F4 @ =0x081E933C
	str r1, [r0, #0x48]
	ldr r1, _080603F8 @ =0x08297FBC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080603EC: .4byte 0x0201774C
_080603F0: .4byte 0x08BA3B6C
_080603F4: .4byte 0x081E933C
_080603F8: .4byte 0x08297FBC
