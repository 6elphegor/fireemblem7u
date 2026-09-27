	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxlvupbg
NewEfxlvupbg: @ 0x08069E30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069E64 @ =0x08BDB754
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08069E68 @ =0x082E5C00
	str r1, [r0, #0x48]
	ldr r1, _08069E6C @ =0x08BDB76C
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08069E70 @ =0x08BDB798
	str r1, [r0, #0x54]
	ldr r0, _08069E74 @ =0x081E3EB4
	movs r1, #0x20
	bl SpellFx_RegisterBgPal
	bl SpellFx_SetSomeColorEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069E64: .4byte 0x08BDB754
_08069E68: .4byte 0x082E5C00
_08069E6C: .4byte 0x08BDB76C
_08069E70: .4byte 0x08BDB798
_08069E74: .4byte 0x081E3EB4
