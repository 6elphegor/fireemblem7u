	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A62C
sub_0805A62C: @ 0x0805A62C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805A66C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805A670 @ =0x08BA2858
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _0805A674 @ =0x081E87D0
	str r1, [r0, #0x48]
	ldr r1, _0805A678 @ =0x08BA2870
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _0805A67C @ =0x0827C2E4
	movs r1, #0x80
	lsls r1, r1, #6
	bl SpellFx_RegisterBgGfx
	bl SpellFx_SetSomeColorEffect
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A66C: .4byte 0x0201774C
_0805A670: .4byte 0x08BA2858
_0805A674: .4byte 0x081E87D0
_0805A678: .4byte 0x08BA2870
_0805A67C: .4byte 0x0827C2E4
