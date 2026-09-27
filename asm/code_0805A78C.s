	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A78C
sub_0805A78C: @ 0x0805A78C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805A7C8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A7CC @ =0x08BA28C0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805A7D0 @ =0x081E8814
	str r1, [r0, #0x48]
	ldr r1, _0805A7D4 @ =0x08BA28D8
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805A7D8 @ =0x08BA28EC
	str r1, [r0, #0x54]
	ldr r0, _0805A7DC @ =0x082871D8
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A7C8: .4byte 0x0201774C
_0805A7CC: .4byte 0x08BA28C0
_0805A7D0: .4byte 0x081E8814
_0805A7D4: .4byte 0x08BA28D8
_0805A7D8: .4byte 0x08BA28EC
_0805A7DC: .4byte 0x082871D8
