	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E57C
sub_0805E57C: @ 0x0805E57C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E5B8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E5BC @ =0x08BA347C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E5C0 @ =0x081E914A
	str r1, [r0, #0x48]
	ldr r1, _0805E5C4 @ =0x08BA3494
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _0805E5C8 @ =0x08BA34C8
	str r1, [r0, #0x54]
	ldr r0, _0805E5CC @ =0x08272DBC
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E5B8: .4byte 0x0201774C
_0805E5BC: .4byte 0x08BA347C
_0805E5C0: .4byte 0x081E914A
_0805E5C4: .4byte 0x08BA3494
_0805E5C8: .4byte 0x08BA34C8
_0805E5CC: .4byte 0x08272DBC
