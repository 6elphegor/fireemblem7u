	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805DD28
sub_0805DD28: @ 0x0805DD28
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805DD64 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DD68 @ =0x08BA3234
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805DD6C @ =0x081E8FC8
	str r1, [r0, #0x48]
	ldr r1, _0805DD70 @ =0x08BA324C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805DD74 @ =0x08BA3280
	str r1, [r0, #0x54]
	ldr r0, _0805DD78 @ =0x08270258
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805DD64: .4byte 0x0201774C
_0805DD68: .4byte 0x08BA3234
_0805DD6C: .4byte 0x081E8FC8
_0805DD70: .4byte 0x08BA324C
_0805DD74: .4byte 0x08BA3280
_0805DD78: .4byte 0x08270258
