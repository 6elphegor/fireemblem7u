	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B660
sub_0805B660: @ 0x0805B660
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805B698 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805B69C @ =0x08BA2BC0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805B6A0 @ =0x081E8A80
	str r1, [r0, #0x48]
	ldr r1, _0805B6A4 @ =0x08279EC4
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B698: .4byte 0x0201774C
_0805B69C: .4byte 0x08BA2BC0
_0805B6A0: .4byte 0x081E8A80
_0805B6A4: .4byte 0x08279EC4
