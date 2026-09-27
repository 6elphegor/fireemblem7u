	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805EDAC
sub_0805EDAC: @ 0x0805EDAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805EDF0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805EDF4 @ =0x08BA363C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805EDF8 @ =0x081E9180
	str r1, [r0, #0x48]
	ldr r1, _0805EDFC @ =0x08BA3654
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805EE00 @ =0x0827747C
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	ldr r0, _0805EE04 @ =0x08276BF0
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EDF0: .4byte 0x0201774C
_0805EDF4: .4byte 0x08BA363C
_0805EDF8: .4byte 0x081E9180
_0805EDFC: .4byte 0x08BA3654
_0805EE00: .4byte 0x0827747C
_0805EE04: .4byte 0x08276BF0
