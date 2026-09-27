	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F1FC
sub_0805F1FC: @ 0x0805F1FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805F230 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F234 @ =0x08BA3720
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _0805F238 @ =0x081E9276
	str r1, [r0, #0x48]
	ldr r1, _0805F23C @ =0x0828FD00
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805F230: .4byte 0x0201774C
_0805F234: .4byte 0x08BA3720
_0805F238: .4byte 0x081E9276
_0805F23C: .4byte 0x0828FD00
