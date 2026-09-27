	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F968
sub_0805F968: @ 0x0805F968
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805F9A0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805F9A4 @ =0x08BA38C4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805F9A8 @ =0x081E9296
	str r1, [r0, #0x48]
	ldr r1, _0805F9AC @ =0x082929CC
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9A0: .4byte 0x0201774C
_0805F9A4: .4byte 0x08BA38C4
_0805F9A8: .4byte 0x081E9296
_0805F9AC: .4byte 0x082929CC
